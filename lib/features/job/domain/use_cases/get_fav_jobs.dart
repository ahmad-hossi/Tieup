import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/job/domain/entities/job.dart';
import 'package:tieup/features/job/domain/repositories/job_repository.dart';

class GetFavJobs extends UseCase<List<Job>,NoParams>{
  JobRepository repository;
  GetFavJobs(this.repository);

  @override
  Future<Either<Failure, List<Job>>> call(NoParams params) {
      return repository.getFavJobs();
   }

}