import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/personal_information/data/models/personal_information_model.dart';

abstract class PersonalInformationRemoteDataSource {
  Future<PersonalInformationModel> getPersonalInformation();
  Future<PersonalInformationModel> updatePersonalInformation(Map<String , String> body);
}

class PersonalInformationRemoteDateSourceImpl
    implements PersonalInformationRemoteDataSource {
  http.Client client;

  PersonalInformationRemoteDateSourceImpl({required this.client});

  @override
  Future<PersonalInformationModel> getPersonalInformation() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/auth/get/personal/information',
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if(response.statusCode == 210){
      return PersonalInformationModel.fromJson(json.decode(response.body));
    }
    else if(response.statusCode == 401) {
      throw UnauthenticatedException();
    }else {
      throw ServerException();
    }
  }

  @override
  Future<PersonalInformationModel> updatePersonalInformation(Map<String, String> body) async{
    print(body);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
    };

    final response = await client.post(
      Uri.parse(
        '$kBaseUrl/user/auth/update/personal/information',
      ),
      headers: headers,
      body: body,
    );
    print(response.body);
    print(response.statusCode);
    if(response.statusCode == 240){
      return PersonalInformationModel.fromJson(json.decode(response.body));
    }
    else if(response.statusCode == 401) {
      throw UnauthenticatedException();
    }else {
      throw ServerException();
    }
  }
}
