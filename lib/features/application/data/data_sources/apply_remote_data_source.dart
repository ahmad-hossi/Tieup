import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';

abstract class ApplyRemoteDataSource {
  Future<bool> apply(int id, String type);
}

class ApplyRemoteDataSourceImpl implements ApplyRemoteDataSource {
  http.Client client;
  ApplyRemoteDataSourceImpl(this.client);

  @override
  Future<bool> apply(int id, String type) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.post(
        Uri.parse(
          '$kBaseUrl/user/application/createOrCancel',
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'applicable_type': type,
          'applicable_id': id.toString()
        });
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body)['data'];
      return responseData == "Create Success" ? true : false;
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }
}
