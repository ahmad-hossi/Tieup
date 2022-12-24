import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  Future<bool> userLogin(String email, String password);
  Future<bool> userSignUp(Map<String, dynamic > requestBody);

}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  http.Client client;
  AuthenticationRemoteDataSourceImpl(this.client);

  @override
  Future<bool> userLogin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse('$kBaseUrl/api/auth/login');
    try{
      final response = await client.post(url, body: {
        'email': email,
        'password': password,
        'type': 'user',
      });

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final token = responseData['data']['token'];
        prefs.setString('token', token);
        return true;
      } else if (response.statusCode == 400) {
        print(400);
        throw UnauthorisedException();
      }
      else {
        throw ServerException();
      }
    }catch(e){
      throw ServerException();
    }
  }

  @override
  Future<bool> userSignUp(Map<String, dynamic> requestBody) async{
    final prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse('$kBaseUrl/api/auth/signUp');
    final response = await client.post(
        url,
        headers: {
          'Accept': 'application/json',
        },
        body: requestBody
    );
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
