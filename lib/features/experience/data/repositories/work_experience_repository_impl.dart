import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/experience/data/data_sources/work_experience_remote_data_source.dart';
import 'package:tieup/features/experience/domain/entities/experience.dart';
import 'package:tieup/features/experience/domain/repositories/work_experience_repository.dart';

class WorkExperienceRepositoryImpl implements WorkExperienceRepository {
  WorkExperienceRemoteDataSource remoteDataSource;
  WorkExperienceRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Experience>>> getWorkExperience() async {
    try {
      return Right(await remoteDataSource.getWorkExperience());
    } on UnauthenticatedException {
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, bool>> addWorkExperience(
      Map<String, dynamic> body) async {
    try {
      return Right(await remoteDataSource.addWorkExperience(body));
    } on UnauthenticatedException {
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }
}
