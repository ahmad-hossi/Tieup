import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/favorite/data/data_sources/favorite_remote_data_source.dart';
import 'package:tieup/features/favorite/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository{
  FavoriteRemoteDataSource remoteDataSource;
  FavoriteRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, bool>> addToFav(int id, String type) async{
    try {
      final response = await remoteDataSource.addToFav(id, type);
      return Right(response);
    } on UnauthenticatedException {
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

}