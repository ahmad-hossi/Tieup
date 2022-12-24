import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/portfolio/domain/entities/portfolio.dart';
import 'package:tieup/features/portfolio/domain/repositories/portfolio_repository.dart';

class GetUserPortfolio extends UseCase<List<Portfolio>,NoParams>{
  PortfolioRepository repository;
  GetUserPortfolio(this.repository);

  @override
  Future<Either<Failure, List<Portfolio>>> call(NoParams params) {
    return repository.getUserPortfolio();
  }

}