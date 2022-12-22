import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/course/domain/entities/course.dart';
import 'package:tieup/features/course/domain/repositories/course_repository.dart';

class GetCourses extends UseCase<List<Course>,NoParams>{
  final CourseRepository repository;
  GetCourses(this.repository);

  @override
  Future<Either<Failure, List<Course>>> call(NoParams params) {
    return repository.getCourses();
  }
}