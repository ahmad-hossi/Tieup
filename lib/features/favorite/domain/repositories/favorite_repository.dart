import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, bool>> addToFav(int id, String type);
}
