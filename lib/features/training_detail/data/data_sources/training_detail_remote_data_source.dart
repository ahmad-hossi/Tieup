import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/training_detail/data/models/training_detail_model.dart';

abstract class TrainingDetailRemoteDataSource {
  Future<TrainingDetailModel> getTrainingDetails(int trainingId);
}

class TrainingDetailRemoteDataSourceImpl implements TrainingDetailRemoteDataSource{
  http.Client client;
  TrainingDetailRemoteDataSourceImpl(this.client);


  @override
  Future<TrainingDetailModel> getTrainingDetails(int trainingId) async{
    final response = await client.get(
      Uri.parse(
        '$kBaseUrl/training/get/$trainingId',
      ),
      headers: {
        'Accept': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 210) {
      final responseData = json.decode(response.body)['data'];
      return TrainingDetailModel.fomJson(responseData);
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
  }

}
