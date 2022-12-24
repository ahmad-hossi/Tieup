import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';

abstract class MotivationLetterRemoteDataSource {
  Future<String> getMotivationLetter();
  Future<String> updateMotivationLetter(String text);
}

class MotivationLetterRemoteDataSourceImpl
    implements MotivationLetterRemoteDataSource {
  http.Client client;
  MotivationLetterRemoteDataSourceImpl(this.client);

  @override
  Future<String> getMotivationLetter() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/MotivationLetter/get',
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 210) {
      final responseData = json.decode(response.body)['data'];
      return responseData['text'];
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> updateMotivationLetter(String text) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.post(
        Uri.parse(
          '$kBaseUrl/user/MotivationLetter/createOrUpdate',
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'text': text,
        });
    print(response.body);
    if (response.statusCode == 220) {
      final responseData = json.decode(response.body)['data'];
      return responseData['text'];
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }
}
