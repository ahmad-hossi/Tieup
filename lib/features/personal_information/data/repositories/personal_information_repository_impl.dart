import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/update_pesrsonal_information_params.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/personal_information/data/data_sources/personal_information_remote_data_source.dart';
import 'package:tieup/features/personal_information/data/models/personal_information_model.dart';
import 'package:tieup/features/personal_information/domain/repositories/personal_information_repository.dart';

class PersonalInformationRepositoryImpl
    implements PersonalInformationRepository {
  final PersonalInformationRemoteDataSource _remoteDataSource;
  PersonalInformationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PersonalInformationModel>> getPersonalInformation() async {
    try {
      final response = await _remoteDataSource.getPersonalInformation();
      return Right(response);
    } on UnauthenticatedException {
      print('UnauthorisedException');
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, PersonalInformationModel>> updatePersonalInformation(
      PersonalInformationParams params) async{
    try {
      final response = await _remoteDataSource.updatePersonalInformation(params.toMap());
      return Right(response);
    } on UnauthenticatedException {
      print('UnauthorisedException');
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }
}
