import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/experience/domain/entities/experience.dart';
import 'package:tieup/features/experience/domain/repositories/work_experience_repository.dart';

class GetWorkExperience extends UseCase<List<Experience>, NoParams> {
  WorkExperienceRepository repository;
  GetWorkExperience(this.repository);

  @override
  Future<Either<Failure, List<Experience>>> call(NoParams params) async {
    return await repository.getWorkExperience();
  }
}
