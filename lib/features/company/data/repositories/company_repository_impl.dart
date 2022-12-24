import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/company/data/data_sources/company_remote_data_source.dart';
import 'package:tieup/features/company/domain/entities/company.dart';
import 'package:tieup/features/company/domain/repositories/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository{
  CompanyRemoteDataSource remoteDataSource;
  CompanyRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Company>>> getAllCompanies() async{
    try {
      return Right(await remoteDataSource.getAllCompanies());
    } on UnauthenticatedException {
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }
}