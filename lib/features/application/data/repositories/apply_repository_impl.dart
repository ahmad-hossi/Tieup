import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/application/data/data_sources/apply_remote_data_source.dart';
import 'package:tieup/features/application/domain/repositories/apply_repository.dart';

class ApplyRepositoryImpl implements ApplyRepository{
  ApplyRemoteDataSource remoteDataSource;
  ApplyRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, bool>> apply(int id, String type) async{
    try {
      final response = await remoteDataSource.apply(id, type);
      return Right(response);
    } on UnauthenticatedException {
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }
}