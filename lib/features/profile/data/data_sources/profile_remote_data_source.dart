import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';

import 'package:tieup/features/profile/data/models/profile_model.dart';
import 'package:http/http.dart' as http;

abstract class ProfileRemoteDataSource{
  Future<ProfileModel> getUserProfile();
  Future<bool> updateUserImage(File imageFile, String type,int userId);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
  http.Client client;
  ProfileRemoteDataSourceImpl(this.client);

  @override
  Future<ProfileModel> getUserProfile() async{
     //try{
       final prefs = await SharedPreferences.getInstance();
       final token = prefs.getString('token');
       final response = await client.get(
         Uri.parse(
           '$kBaseUrl/user/auth/get/profile'
         ),
         headers: {
           'Accept': 'application/json',
           'Authorization': 'Bearer $token',
         },
       );
       print(response.body);
       if(response.statusCode == 210){
         return ProfileModel.fromJson(json.decode(response.body)['data']);
       }
       else if(response.statusCode == 401) {
         throw UnauthenticatedException();
       }else {
         throw ServerException();
       }
     // }catch(e){
     //   throw ServerException();
     // }


  }

  @override
  Future<bool> updateUserImage(File imageFile, String type, int userId) async{
    print('hello again');
    final prefs = await SharedPreferences.getInstance();
   // try{
      final token = prefs.getString('token');
      String url = '$kBaseUrl/api/photo/upload';
      var dio = Dio();
      Options options = Options(
          followRedirects: false,
          validateStatus: (status) { return status! < 500; }
      );
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(imageFile.path),
        "type": type,
        "id" : userId.toString()
      });
      options.headers = { "Authorization" : "Bearer $token" , "Accept":"application/json"} ;
      var response = await dio.post(url, data: formData,options: options );
      print(response.data);
      print(response.statusCode);
      if(response.statusCode == 220){
        print('image true');
        return true;
      }
      else {
        throw ServerException();
      }
    // }catch(e){
    //   throw ServerException();
    // }
  }

}