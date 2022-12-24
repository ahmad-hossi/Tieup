

import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/motivation_letter/data/data_sources/motivation_letter_remote_data_source.dart';
import 'package:tieup/features/motivation_letter/domain/repositories/motivation_letter_repository.dart';

class MotivationLetterRepositoryImpl implements MotivationLetterRepository{
  final MotivationLetterRemoteDataSource _remoteDataSource;
  MotivationLetterRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, String>> getMotivationLetter() async{
    try {
      final response = await _remoteDataSource.getMotivationLetter();
      return Right(response);
    } on UnauthenticatedException {
      print('UnauthorisedException');
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, String>> updateMotivationLetter(String text) async{
    try {
      final response = await _remoteDataSource.updateMotivationLetter(text);
      return Right(response);
    } on UnauthenticatedException {
      print('UnauthorisedException');
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

}