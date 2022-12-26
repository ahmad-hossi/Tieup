import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:tieup/features/profile/domain/entities/profile.dart';
import 'package:tieup/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  ProfileRemoteDataSource remoteDataSource;
  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Profile>> getUserProfile() async{
    try {
      final response = await remoteDataSource.getUserProfile();
      return Right(response);
    } on UnauthenticatedException {
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

}