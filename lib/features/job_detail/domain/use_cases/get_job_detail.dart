import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/job_detail/domain/entities/job_detail.dart';
import 'package:tieup/features/job_detail/domain/repositories/job_detail_repository.dart';

class GetJobDetail extends UseCase<JobDetail,Params>{
  JobDetailRepository repository;
  GetJobDetail(this.repository);

  @override
  Future<Either<Failure, JobDetail>> call(Params params) async{
    return await repository.getJobDetail(params.id);
  }
}