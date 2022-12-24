part of 'portfolio_bloc.dart';

@immutable
abstract class PortfolioEvent {}

class GetUserPortfolioEvent extends PortfolioEvent{}

class UpdateUserPortfolioEvent extends PortfolioEvent{
   final List<Map<String,dynamic>> userPortfolio;
   UpdateUserPortfolioEvent({required this.userPortfolio});
}