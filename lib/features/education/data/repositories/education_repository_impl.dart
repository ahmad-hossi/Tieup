import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/education_params.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/education/data/data_sources/education_remote_data_source.dart';
import 'package:tieup/features/education/domain/entities/education.dart';
import 'package:tieup/features/education/domain/repositories/education_repository.dart';

class EducationRepositoryImpl implements EducationRepository{
  EducationRemoteDataSource remoteDataSource;
  EducationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Education>>> getUserEducation() async{
    try {
      return Right(await remoteDataSource.getUserEducation());
    } on UnauthenticatedException {
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, bool>> addUserEducation(EducationParams params) async{
    try {
      return Right(await remoteDataSource.addUserEducation(params));
    } on UnauthenticatedException {
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

}