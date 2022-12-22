import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/job/domain/entities/job.dart';

abstract class JobRepository{
  Future<Either<Failure,List<Job>>> getJobs();
  Future<Either<Failure,List<Job>>> getFavJobs();
}
