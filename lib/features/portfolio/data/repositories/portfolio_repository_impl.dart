import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/portfolio/data/data_sources/portfolio_repository_remote_data_source.dart';
import 'package:tieup/features/portfolio/domain/entities/portfolio.dart';
import 'package:tieup/features/portfolio/domain/repositories/portfolio_repository.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  PortfolioRemoteDataSource remoteDataSource;
  PortfolioRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Portfolio>>> getUserPortfolio() async {
    try {
      return Right(await remoteDataSource.getUserPortfolio());
    } on UnauthenticatedException {
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, List<Portfolio>>> updateUserPortfolio(
      Map<String, dynamic> requestBody) async {
    try {
      return Right(await remoteDataSource.updateUserPortfolio(requestBody));
    } on UnauthenticatedException {
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    } on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }
}
