part of 'company_bloc.dart';

@immutable
abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final CompanyDetail companyDetail;
  CompanyLoaded({required this.companyDetail});
}

class CompanyFailed extends CompanyState {
  final String errorMessage;
  CompanyFailed({required this.errorMessage});
}
