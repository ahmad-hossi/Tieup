import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';

import 'package:tieup/features/profile/data/models/profile_model.dart';
import 'package:http/http.dart' as http;

abstract class ProfileRemoteDataSource{
  Future<ProfileModel> getUserProfile();
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

}