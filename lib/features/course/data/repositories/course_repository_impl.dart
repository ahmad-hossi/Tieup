import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/course_params.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/course/data/data_sources/course_remote_Data_source.dart';
import 'package:tieup/features/course/domain/entities/course.dart';
import 'package:tieup/features/course/domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository{
  CourseRemoteDataSource remoteDataSource;
  CourseRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Course>>> getCourses() async{
    try {
      return Right(await remoteDataSource.getCourses());
    } on UnauthenticatedException {
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, bool>> addCourse(CourseParams params) async{
    try {
      return Right(await remoteDataSource.addCourse(params));
    } on UnauthenticatedException {
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

}