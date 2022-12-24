import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/portfolio/domain/entities/portfolio.dart';

abstract class PortfolioRepository{
  Future<Either<Failure,List<Portfolio>>> getUserPortfolio();
  Future<Either<Failure,List<Portfolio>>> updateUserPortfolio(Map<String,dynamic> requestBody);
}
