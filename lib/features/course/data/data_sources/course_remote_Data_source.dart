import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/entities/course_params.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/course/data/models/course_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:io';

abstract class CourseRemoteDataSource{
  Future<List<CourseModel>> getCourses();
  Future<bool> addCourse(CourseParams params);
}


class CourseRemoteDataSourceImpl implements CourseRemoteDataSource{
  http.Client client;
  CourseRemoteDataSourceImpl(this.client);

  @override
  Future<List<CourseModel>> getCourses() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/course/get',
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
          .map((courseModel) => CourseModel.fromJson(
          courseModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> addCourse(CourseParams params) async{
    print(params);
    print('hello');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    //try{
      final response = await client.post(
        Uri.parse(
          '$kBaseUrl/user/course/createOrUpdate',
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'sub_domain_id' : params.subDomainId.toString(),
          'name' : params.name,
          'from' : params.from,
          'date_of_achievement' :params.dateOfAchievement,
        }
      );
      print(response.body);
      if (response.statusCode == 220) {
        final responseData = json.decode(response.body)['data'];
        String imageUrl = await uploadCourseImage(image: params.imageFile,
            courseId: responseData['id']);
        responseData['image'] = '$kBaseUrl/$imageUrl';
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
    required int courseId})async{
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
        "type": 'course',
        "id" : courseId.toString()
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