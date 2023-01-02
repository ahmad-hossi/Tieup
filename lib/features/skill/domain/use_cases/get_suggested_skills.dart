import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/skill/domain/repositories/skill_repository.dart';

class GetSuggestedSkills extends UseCase<List<String>,NoParams>{
  SkillRepository repository;
  GetSuggestedSkills(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) {
   return repository.getSuggestedSkills();
  }

}