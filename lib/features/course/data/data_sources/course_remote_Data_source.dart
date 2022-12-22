import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/course/data/models/course_model.dart';
import 'package:http/http.dart' as http;

abstract class CourseRemoteDataSource{
  Future<List<CourseModel>> getCourses();
}


class CourseRemoteDataSourceImpl implements CourseRemoteDataSource{
  http.Client client;
  CourseRemoteDataSourceImpl(this.client);

  @override
  Future<List<CourseModel>> getCourses() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/user/course/get',
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
          .map((courseModel) => CourseModel.fromJson(
          courseModel as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

}