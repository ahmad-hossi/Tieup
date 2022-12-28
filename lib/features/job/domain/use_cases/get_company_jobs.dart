import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/job/domain/entities/job.dart';
import 'package:tieup/features/job/domain/repositories/job_repository.dart';

class GetCompanyJobs extends UseCase<List<Job>, Params> {
  JobRepository repository;
  GetCompanyJobs(this.repository);

  @override
  Future<Either<Failure, List<Job>>> call(Params params) {
    return repository.getCompanyJobs(params.id);
  }
}
