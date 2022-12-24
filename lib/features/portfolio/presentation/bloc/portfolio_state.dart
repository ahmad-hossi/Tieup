part of 'portfolio_bloc.dart';


@immutable
abstract class PortfolioState {}
class PortfolioInitial extends PortfolioState {}
class PortfolioLoading extends PortfolioState {}
class PortfolioLoaded extends PortfolioState {
  final List<Portfolio> userPortfolio;
  PortfolioLoaded({required this.userPortfolio});
}
class PortfolioFailed extends PortfolioState {
  final String errorMessage;
  PortfolioFailed({required this.errorMessage});
}

