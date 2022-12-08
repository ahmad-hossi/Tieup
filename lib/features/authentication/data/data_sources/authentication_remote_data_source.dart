import 'dart:convert';
import 'package:tieup/core/error/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  Future<bool> userLogin(String email, String password);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final Dio _dio;

  AuthenticationRemoteDataSourceImpl(this._dio);

  @override
  Future<bool> userLogin(String email, String password) async {
    print('hiiii');
    await Future.delayed(Duration(milliseconds: 2500));

    Uri url = Uri.parse(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyANcHN2u0XIqjmDsOizFFLUNTG-UPcSHwk',
    );
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else if (response.statusCode == 400) {
      print(400);
      throw UnauthorisedException();
    } else {
      throw ServerException();
    }
  }
}
