import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/work_experience_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/experience/domain/entities/experience.dart';
import 'package:tieup/features/experience/domain/repositories/work_experience_repository.dart';

class AddWorkExperience extends UseCase<bool, WorkExperienceParams> {
  WorkExperienceRepository repository;
  AddWorkExperience(this.repository);

  @override
  Future<Either<Failure, bool>> call(WorkExperienceParams params) async {
    return await repository.addWorkExperience(params.toJson());
  }
}