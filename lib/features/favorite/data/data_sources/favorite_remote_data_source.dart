import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';

abstract class FavoriteRemoteDataSource {
  Future<bool> addToFav(int id, String type);
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  http.Client client;
  FavoriteRemoteDataSourceImpl(this.client);

  @override
  Future<bool> addToFav(int id, String type) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.post(
        Uri.parse(
          '$kBaseUrl/user/favorite/createOrDelete',
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'favourable_type': type,
          'favourable_id': id.toString()
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
