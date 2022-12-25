import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/course_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/course/domain/repositories/course_repository.dart';

class AddCourse extends UseCase<bool,CourseParams>{
  CourseRepository repository;
  AddCourse(this.repository);

  @override
  Future<Either<Failure, bool>> call(CourseParams params) {
   return repository.addCourse(params);
  }

}