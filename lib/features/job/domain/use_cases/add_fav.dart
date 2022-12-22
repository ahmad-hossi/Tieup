
import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/fav_params.dart';
import 'package:tieup/core/error/failures.dart';

import 'package:tieup/core/use_cases/use_case.dart';

class AddFav extends UseCase<bool,FavParams>{

  @override
  Future<Either<Failure, bool>> call(FavParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}