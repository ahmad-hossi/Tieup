import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/skill/domain/entities/skill.dart';
import 'package:tieup/features/skill/domain/repositories/skill_repository.dart';

class AddUserSkills extends UseCase<List<Skill>, List<Skill>>{
  SkillRepository repository;
  AddUserSkills(this.repository);

  @override
  Future<Either<Failure, List<Skill>>> call(List<Skill> params) {
   return repository.addUserSkills(params);
  }

}