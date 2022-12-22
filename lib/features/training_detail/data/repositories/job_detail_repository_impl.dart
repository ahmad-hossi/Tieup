import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/training_detail/data/data_sources/training_detail_remote_data_source.dart';
import 'package:tieup/features/training_detail/domain/entities/training_detail.dart';
import 'package:tieup/features/training_detail/domain/repositories/training_detail_repository.dart';

class TrainingDetailRepositoryImpl implements TrainingDetailRepository{
  TrainingDetailRemoteDataSource remoteDataSource;
  TrainingDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, TrainingDetail>> getTrainingDetail(int trainingId) async{
    try {
      return Right(await remoteDataSource.getTrainingDetails(trainingId));
    } on UnauthenticatedException {
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }



}