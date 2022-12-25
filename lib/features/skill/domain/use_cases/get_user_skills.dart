import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/skill/domain/entities/skill.dart';
import 'package:tieup/features/skill/domain/repositories/skill_repository.dart';

class GetUserSkills extends UseCase<List<Skill>,NoParams>{
  SkillRepository repository;
  GetUserSkills(this.repository);

  @override
  Future<Either<Failure, List<Skill>>> call(NoParams params) {
    return repository.getUserSkills();
  }
}