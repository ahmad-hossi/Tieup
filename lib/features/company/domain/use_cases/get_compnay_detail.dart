import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/company/domain/entities/company_detail.dart';
import 'package:tieup/features/company/domain/repositories/company_repository.dart';

class GetCompanyDetail extends UseCase<CompanyDetail, Params> {
  CompanyRepository repository;
  GetCompanyDetail(this.repository);

  @override
  Future<Either<Failure, CompanyDetail>> call(Params params) {
    return repository.getCompanyDetail(params.id);
  }
}
