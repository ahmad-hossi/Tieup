import 'package:dartz/dartz.dart';
import 'package:tieup/core/constants/portfolio_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/portfolio/domain/entities/portfolio.dart';
import 'package:tieup/features/portfolio/domain/repositories/portfolio_repository.dart';

class UpdateUserPortfolio extends UseCase<List<Portfolio>,PortfolioParams>{
  PortfolioRepository repository;
  UpdateUserPortfolio(this.repository);

  @override
  Future<Either<Failure, List<Portfolio>>> call(PortfolioParams params) {
    return repository.updateUserPortfolio(params.toJson());
  }

}