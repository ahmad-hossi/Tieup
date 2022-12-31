part of 'job_bloc.dart';

@immutable
abstract class JobEvent {}

class GetALlJobsEvent extends JobEvent{}

class GetCompanyJobsEvent extends JobEvent{
  final int companyId;
  GetCompanyJobsEvent({required this.companyId});
}

class GetFavJobsEvent extends JobEvent{}

class GetAppliedJobsEvent extends JobEvent{}
