import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/languages/data/models/language_model.dart';

abstract class LanguagesRemoteDataSource {
  Future<List<LanguageModel>> getLanguages();
  Future<bool> addLanguage(Map<String, dynamic> body);
}

class LanguagesRemoteDataSourceImpl implements LanguagesRemoteDataSource {
  http.Client client;
  LanguagesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<LanguageModel>> getLanguages() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/LanguageUser/get',
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
          .map((languageModel) =>
              LanguageModel.fromJson(languageModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> addLanguage(Map<String, dynamic> body)async{
    print('hi');
    print(body);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.post(
      Uri.parse(
        '$kBaseUrl/user/LanguageUser/createOrUpdate',
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: body
    );
    print(response.body);
    if (response.statusCode == 220) {
      return true;
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }
}
