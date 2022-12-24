part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeCompanyInitial extends HomeState {}

class HomeCompanyLoading extends HomeState {}

class HomeCompanyLoaded extends HomeState {
  final List<Company> companies;
  HomeCompanyLoaded({required this.companies});
}

class HomeCompanyFailed extends HomeState {
  final String errorMessage;
  HomeCompanyFailed(this.errorMessage);
}
