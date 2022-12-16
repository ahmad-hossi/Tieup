import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/add_skills/domain/entities/skill.dart';
import 'package:tieup/features/add_skills/domain/repositories/skill_repository.dart';

class GetSkills extends UseCase<List<Skill>, Params> {
  SkillRepository repository;
  GetSkills(this.repository);

  @override
  Future<Either<Failure, List<Skill>>> call(Params params) async {
    return await repository.getSkills(params.id);
  }
}
