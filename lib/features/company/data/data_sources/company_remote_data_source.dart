import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/company/data/models/company_detail_model.dart';
import 'package:tieup/features/company/data/models/company_model.dart';
import 'package:http/http.dart' as http;

abstract class CompanyRemoteDataSource {
  Future<List<CompanyModel>> getAllCompanies();
  Future<CompanyDetailModel> getCompanyDetail(int companyId);
}

class CompanyRemoteDataSourceImpl implements CompanyRemoteDataSource {
  http.Client client;
  CompanyRemoteDataSourceImpl(this.client);

  @override
  Future<List<CompanyModel>> getAllCompanies() async {
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/company/all',
      ),
      headers: {
        'Accept': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 210) {
      final responseData = json.decode(response.body)['data'];
      return (responseData as List<dynamic>)
          .map((companyModel) =>
              CompanyModel.fromJson(companyModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CompanyDetailModel> getCompanyDetail(int companyId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/get/company/profile/$companyId',
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 210) {
      final responseData = json.decode(response.body)['data'];
      return CompanyDetailModel.fomJson(responseData);
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }
}
