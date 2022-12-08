import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:tieup/features/authentication/domain/repositories/authentication_repositry.dart';
import 'package:dartz/dartz.dart';


class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _remoteDataSource;

  AuthenticationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    try{
      final response = await _remoteDataSource.userLogin(email, password);
      return Right(response);
    }
    on UnauthorisedException {
      print('UnauthorisedException');
      return const Left(Failure(errorType: ErrorType.unauthorisedError));
    }
    on ServerException{
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }
}
