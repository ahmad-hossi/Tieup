import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:tieup/features/training/data/models/training_model.dart';

abstract class TrainingRemoteDataSource{
  Future<List<TrainingModel>> getTrainings();
  Future<List<TrainingModel>> getCompanyTrainings(int companyId);
  Future<List<TrainingModel>> getFavTrainings();
  Future<List<TrainingModel>> getAppliedTrainings();
  Future<List<TrainingModel>> getSuggestTrainings();
}

class TrainingRemoteDataSourceImpl implements TrainingRemoteDataSource{
  http.Client client;
  TrainingRemoteDataSourceImpl(this.client);

  @override
  Future<List<TrainingModel>> getTrainings() async{
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/training/all',
      ),
      headers: {
        'Accept': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 210) {
      final responseData = json.decode(response.body)['data'];
      return (responseData as List<dynamic>)
          .map((trainingModel) => TrainingModel.fromJson(
          trainingModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TrainingModel>> getFavTrainings() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/favorite/jobs/get',
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
          .map((trainingModel) => TrainingModel.fromJson(
          trainingModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TrainingModel>> getCompanyTrainings(int companyId) async{
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/training/all/$companyId',
      ),
      headers: {
        'Accept': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 210) {
      final responseData = json.decode(response.body)['data'];
      return (responseData as List<dynamic>)
          .map((trainingModel) => TrainingModel.fromJson(
          trainingModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TrainingModel>> getAppliedTrainings() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/application/trainings/get',
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
          .map((trainingModel) => TrainingModel.fromJson(
          trainingModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TrainingModel>> getSuggestTrainings() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/get/suggest/training',
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
          .map((trainingModel) => TrainingModel.fromJson(
          trainingModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

}