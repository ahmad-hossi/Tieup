part of 'company_bloc.dart';

@immutable
abstract class CompanyEvent {}

class GetCompanyDetailEvent extends CompanyEvent {
  final int companyId;
  GetCompanyDetailEvent({required this.companyId});
}
