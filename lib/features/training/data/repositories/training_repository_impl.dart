import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/training/data/data_sources/training_remote_data_source.dart';
import 'package:tieup/features/training/domain/entities/training.dart';
import 'package:tieup/features/training/domain/repositories/training_repository.dart';

class TrainingRepositoryImpl implements TrainingRepository{
  TrainingRemoteDataSource remoteDataSource;
  TrainingRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Training>>> getTrainings() async{
    try {
      return Right(await remoteDataSource.getTrainings());
    } on UnauthenticatedException {
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, List<Training>>> getFavTrainings() async {
    try {
      return Right(await remoteDataSource.getFavTrainings());
    } on UnauthenticatedException {
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

}