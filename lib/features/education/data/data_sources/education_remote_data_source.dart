import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/entities/education_params.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/education/data/models/education_model.dart';
import 'package:dio/dio.dart';

abstract class EducationRemoteDataSource{
  Future<List<EducationModel>> getUserEducation();
  Future<bool> addUserEducation(EducationParams params);
}

class EducationRemoteDataSourceImpl implements EducationRemoteDataSource{
  http.Client client;
  EducationRemoteDataSourceImpl(this.client);

  @override
  Future<List<EducationModel>> getUserEducation() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/EducationCertificate/get',
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 210) {
      final responseData = json.decode(response.body)['data'];
      return (responseData as List<dynamic>)
          .map((educationModel) => EducationModel.fromJson(
          educationModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> addUserEducation(EducationParams params) async{
    print(params);
    print('hello');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    //try{
    final response = await client.post(
        Uri.parse(
          '$kBaseUrl/user/EducationCertificate/createOrUpdate',
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
            'field_of_study' : params.fieldOfStudy,
            'education_type_id' : params.educationTypeId.toString(),
            'from' : params.from,
            'grade' :params.grade,
            'start_date' : params.startDate,
            'end_date' : params.endDate
        }
    );
    print(response.body);
    if (response.statusCode == 220) {
      final responseData = json.decode(response.body)['data'];
      if(params.imageFile != null){
        String imageUrl = await uploadCourseImage(image: params.imageFile!,
            id: responseData['id']);
      }
      return true;
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
    // }
    // catch(e){
    //   throw ServerException();
    // }
  }


  Future<String> uploadCourseImage({required File image,
    required int id})async{
    print('hello again');
    final prefs = await SharedPreferences.getInstance();
    try{
      final token = prefs.getString('token');
      String url = '$kBaseUrl/api/photo/upload';
      var dio = Dio();
      Options options = Options(
          followRedirects: false,
          validateStatus: (status) { return status! < 500; }
      );
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(image.path),
        "type": 'educationCertificate',
        "id" : id.toString()
      });
      options.headers = { "Authorization" : "Bearer $token" , "Accept":"application/json"} ;
      var response = await dio.post(url, data: formData,options: options );
      print(response.data);
      if(response.statusCode == 220){
        return response.data['data']['image'];
      }
      else {
        throw ServerException();
      }
    }catch(e){
      throw ServerException();
    }
  }

}