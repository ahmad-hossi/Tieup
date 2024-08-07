import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/job/data/models/job_model.dart';
import 'package:http/http.dart' as http;

abstract class JobRemoteDataSource{
  Future<List<JobModel>> getJobs();
  Future<List<JobModel>> getCompanyJobs(int companyId);
  Future<List<JobModel>> getFavJobs();
  Future<List<JobModel>> getAppliedJobs();
  Future<List<JobModel>> getSuggestJobs();
}

class JobRemoteDataSourceImpl implements JobRemoteDataSource{
  http.Client client;
  JobRemoteDataSourceImpl(this.client);

  @override
  Future<List<JobModel>> getJobs() async{
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/job/all',
      ),
      headers: {
        'Accept': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 210) {
      final responseData = json.decode(response.body)['data'];
      return (responseData as List<dynamic>)
          .map((jobModel) => JobModel.fromJson(
          jobModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<JobModel>> getFavJobs() async{
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
          .map((jobModel) => JobModel.fromJson(
          jobModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<JobModel>> getCompanyJobs(int companyId) async{
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/job/all/$companyId',
      ),
      headers: {
        'Accept': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 210) {
      final responseData = json.decode(response.body)['data'];
      return (responseData as List<dynamic>)
          .map((jobModel) => JobModel.fromJson(
          jobModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<JobModel>> getAppliedJobs() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/application/jobs/get',
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
          .map((jobModel) => JobModel.fromJson(
          jobModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<JobModel>> getSuggestJobs() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/get/suggest/job',
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
          .map((jobModel) => JobModel.fromJson(
          jobModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

}