import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/motivation_letter/domain/repositories/motivation_letter_repository.dart';

class UpdateMotivationLetter extends UseCase<String,String>{
  MotivationLetterRepository repository;
  UpdateMotivationLetter(this.repository);

  @override
  Future<Either<Failure, String>> call(String params) {
    return repository.updateMotivationLetter(params);
  }

}