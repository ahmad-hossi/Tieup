import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/education_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/education/domain/repositories/education_repository.dart';

class AddUserEducation extends UseCase<bool,EducationParams>{
  EducationRepository educationRepository;
  AddUserEducation(this.educationRepository);

  @override
  Future<Either<Failure, bool>> call(EducationParams params) {
    return educationRepository.addUserEducation(params);
  }

}