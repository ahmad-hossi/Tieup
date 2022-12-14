import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/job_detail/data/models/job_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class JobDetailRemoteDataSource {
  Future<JobDetailModel> getJobDetails(int jobId);
}

class JobDetailRemoteDataSourceImpl implements JobDetailRemoteDataSource{
  http.Client client = http.Client();
  JobDetailRemoteDataSourceImpl(this.client);


  @override
  Future<JobDetailModel> getJobDetails(int jobId) async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/job/get/$jobId',
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 210) {
      final responseData = json.decode(response.body)['data'];
      return JobDetailModel.fomJson(responseData);
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

}
