import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/course_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/course/domain/entities/course.dart';

abstract class CourseRepository{
  Future<Either<Failure,List<Course>>> getCourses();
  Future<Either<Failure,bool>> addCourse(CourseParams params);
}