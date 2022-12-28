import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/job/data/data_sources/job_remote_data_source.dart';
import 'package:tieup/features/job/domain/entities/job.dart';
import 'package:tieup/features/job/domain/repositories/job_repository.dart';

class JobRepositoryImpl implements JobRepository{
  JobRemoteDataSource remoteDataSource;
  JobRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Job>>> getJobs() async{
    try {
      return Right(await remoteDataSource.getJobs());
    } on UnauthenticatedException {
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, List<Job>>> getFavJobs() async{
    try {
      return Right(await remoteDataSource.getFavJobs());
    } on UnauthenticatedException {
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, List<Job>>> getCompanyJobs(int companyId) async{
    try {
      return Right(await remoteDataSource.getCompanyJobs(companyId)); 
    } on UnauthenticatedException {
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

}