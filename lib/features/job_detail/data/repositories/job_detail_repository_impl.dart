import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/job_detail/data/data_sources/job_detail_remote_data_source.dart';
import 'package:tieup/features/job_detail/domain/entities/job_detail.dart';
import 'package:tieup/features/job_detail/domain/repositories/job_detail_repository.dart';

class JobDetailRepositoryImpl implements JobDetailRepository{
  JobDetailRemoteDataSource remoteDataSource;
  JobDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, JobDetail>> getJobDetail(int jobId) async{
    try {
      return Right(await remoteDataSource.getJobDetails(jobId));
    } on UnauthenticatedException {
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }



}