import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  Future<bool> userLogin(String email, String password);
  Future<bool> userSignUp(Map<String, dynamic> requestBody);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  http.Client client;
  AuthenticationRemoteDataSourceImpl(this.client);

  @override
  Future<bool> userLogin(String email, String password) async {
    print(email);
    print(password);
    final prefs = await SharedPreferences.getInstance();
    var dio = Dio();
    Options options = Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        });
    FormData formData = FormData.fromMap({
      'email': email.trim(),
      'password': password.trim(),
      'type': 'user',
    });
    options.headers = {"Accept": "application/json"};
    const url = '$kBaseUrl/api/auth/login';

    try {
      var response = await dio.post(url, data: formData, options: options);

      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        final responseData = response.data;
        final token = responseData['data']['token'];
        prefs.setString('token', token);
        return true;
      } else if (response.statusCode == 400) {
        throw UnauthorisedException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> userSignUp(Map<String, dynamic> requestBody) async {
    final prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse('$kBaseUrl/api/auth/signUp');
    final response = await client.post(url,
        headers: {
          'Accept': 'application/json',
        },
        body: requestBody);
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData['data']['token'];
      prefs.setString('token', token);
      return true;
    } else if (response.statusCode == 520) {
      throw UnauthorisedException();
    } else {
      throw ServerException();
    }
  }
}
