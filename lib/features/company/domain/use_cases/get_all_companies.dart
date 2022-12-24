import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/company/domain/entities/company.dart';
import 'package:tieup/features/company/domain/repositories/company_repository.dart';

class GetAllCompanies extends UseCase<List<Company>,NoParams>{
  CompanyRepository repository;
  GetAllCompanies(this.repository);

  @override
  Future<Either<Failure, List<Company>>> call(NoParams params) async{
    return await repository.getAllCompanies();
  }

}