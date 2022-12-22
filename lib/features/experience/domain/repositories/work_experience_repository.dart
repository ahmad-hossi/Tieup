

import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/experience/domain/entities/experience.dart';

abstract class WorkExperienceRepository{
  Future<Either<Failure,List<Experience>>> getWorkExperience();
  Future<Either<Failure,bool>> addWorkExperience(Map<String , dynamic> body);
}