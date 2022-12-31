import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/fav_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/favorite/domain/repositories/favorite_repository.dart';

class AddToFav extends UseCase<bool, FavParams> {
  FavoriteRepository repository;
  AddToFav(this.repository);

  @override
  Future<Either<Failure, bool>> call(FavParams params) {
    return repository.addToFav(params.id,params.type);
  }
}
