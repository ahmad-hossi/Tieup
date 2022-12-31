import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/fav_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/application/domain/repositories/apply_repository.dart';

class Apply extends UseCase<bool, FavParams> {
  ApplyRepository repository;
  Apply(this.repository);

  @override
  Future<Either<Failure, bool>> call(FavParams params) {
    return repository.apply(params.id,params.type);
  }
}
