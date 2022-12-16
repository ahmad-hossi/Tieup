

import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/languages/data/data_sources/languages_remote_data_source.dart';
import 'package:tieup/features/languages/domain/entities/language.dart';
import 'package:tieup/features/languages/domain/repositories/langauges_repository.dart';

class LanguagesRepositoryImpl implements LanguagesRepository{
  final LanguagesRemoteDataSource _remoteDataSource;
  LanguagesRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Language>>> getLanguages() async{
    try {
      final response = await _remoteDataSource.getLanguages();
      return Right(response);
    } on UnauthenticatedException {
      print('UnauthorisedException');
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, List<Language>>> updateLanguages(Map<String, dynamic> body) {
    // TODO: implement updateLanguages
    throw UnimplementedError();
  }


}
