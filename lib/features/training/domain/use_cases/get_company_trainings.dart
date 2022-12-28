import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/training/domain/entities/training.dart';
import 'package:tieup/features/training/domain/repositories/training_repository.dart';

class GetCompanyTrainings extends UseCase<List<Training>,Params>{
  TrainingRepository repository;
  GetCompanyTrainings(this.repository);

  @override
  Future<Either<Failure, List<Training>>> call(Params params) {
    return repository.getCompanyTrainings(params.id);
  }

}