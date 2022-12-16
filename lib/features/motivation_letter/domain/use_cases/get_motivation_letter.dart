import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/motivation_letter/domain/repositories/motivation_letter_repository.dart';

class GetMotivationLetter implements UseCase<String,NoParams>{
  final MotivationLetterRepository _repository;
  GetMotivationLetter(this._repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async{
    return _repository.getMotivationLetter();
  }

}