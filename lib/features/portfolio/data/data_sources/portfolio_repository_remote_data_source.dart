import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/portfolio/data/models/portfolio_model.dart';
import 'package:http/http.dart' as http;

abstract class PortfolioRemoteDataSource {
  Future<List<PortfolioModel>> getUserPortfolio();
  Future<List<PortfolioModel>> updateUserPortfolio(
      Map<String, dynamic> requestBody);
}

class PortfolioRemoteDataSourceImpl implements PortfolioRemoteDataSource {
  http.Client client;
  PortfolioRemoteDataSourceImpl(this.client);

  @override
  Future<List<PortfolioModel>> getUserPortfolio() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final token = prefs.getString('token');
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final response = await client.get(
        Uri.parse(
          '$kBaseUrl/user/Portfolio/get',
        ),
        headers: headers,
      );
      if (response.statusCode == 210) {
        final responseData = json.decode(response.body)['data'];
        return (responseData as List<dynamic>)
            .map((portfolioModel) =>
                PortfolioModel.fromJson(portfolioModel as Map<String, dynamic>))
            .toList();
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<PortfolioModel>> updateUserPortfolio(
      Map<String, dynamic> requestBody) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final token = prefs.getString('token');
      var headers = {
        "content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final response = await client.post(
          Uri.parse(
            '$kBaseUrl/user/Portfolio/createOrUpdate',
          ),
          headers: headers,
          body: json.encode(requestBody));
      if (response.statusCode == 220) {
        final responseData = json.decode(response.body)['data'];
        return (responseData as List<dynamic>)
            .map((portfolioModel) =>
                PortfolioModel.fromJson(portfolioModel as Map<String, dynamic>))
            .toList();
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
