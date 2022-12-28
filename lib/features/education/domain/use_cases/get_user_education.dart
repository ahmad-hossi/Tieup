import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/education/domain/entities/education.dart';
import 'package:tieup/features/education/domain/repositories/education_repository.dart';

class GetUserEducation extends UseCase<List<Education>,NoParams>{
  EducationRepository repository;
  GetUserEducation(this.repository);

  @override
  Future<Either<Failure, List<Education>>> call(NoParams params) {
    return repository.getUserEducation();
  }

}