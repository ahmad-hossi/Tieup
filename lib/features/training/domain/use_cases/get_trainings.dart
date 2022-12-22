import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/training/domain/entities/training.dart';
import 'package:tieup/features/training/domain/repositories/training_repository.dart';

class GetTrainings extends UseCase<List<Training>,NoParams> {
  TrainingRepository repository;
  GetTrainings(this.repository);

  @override
  Future<Either<Failure, List<Training>>> call(NoParams params){
    return repository.getTrainings();
  }

}