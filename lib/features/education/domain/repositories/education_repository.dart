import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/education_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/education/domain/entities/education.dart';

abstract class EducationRepository{
  Future<Either<Failure,List<Education>>> getUserEducation();
  Future<Either<Failure,bool>> addUserEducation(EducationParams params);
}