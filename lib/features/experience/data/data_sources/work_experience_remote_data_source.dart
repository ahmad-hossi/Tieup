import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/experience/data/models/experience_model.dart';
import 'package:http/http.dart' as http;

abstract class WorkExperienceRemoteDataSource {
  Future<List<ExperienceModel>> getWorkExperience();
  Future<ExperienceModel> addWorkExperience(Map<String, dynamic> body);
}

class WorkExperienceRemoteDataSourceImpl
    implements WorkExperienceRemoteDataSource {
  http.Client client;
  WorkExperienceRemoteDataSourceImpl(this.client);

  @override
  Future<List<ExperienceModel>> getWorkExperience() async {

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await client.get(
        Uri.parse(
          '$kBaseUrl/user/Experiance/get',
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
            .map((workExperienceModel) => ExperienceModel.fromJson(
                workExperienceModel as Map<String, dynamic>))
            .toList();
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else {
        throw ServerException();
      }

  }

  @override
  Future<ExperienceModel> addWorkExperience(Map<String, dynamic> body) async {
    print('object');
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      print(token);
      final response = await client.post(
          Uri.parse(
            '$kBaseUrl/user/Experiance/createOrUpdate',
          ),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body,
          );
      if (response.statusCode == 220) {
        final responseData = json.decode(response.body)['data'];
        return ExperienceModel.fromJson(responseData);
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else {
        throw ServerException();
      }
  }
}
