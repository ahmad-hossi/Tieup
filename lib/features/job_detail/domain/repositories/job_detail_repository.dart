import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/job_detail/domain/entities/job_detail.dart';

abstract class JobDetailRepository{
  Future<Either<Failure,JobDetail>> getJobDetail(int jobId);
}