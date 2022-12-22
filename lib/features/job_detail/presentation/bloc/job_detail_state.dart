part of 'job_detail_bloc.dart';

@immutable
abstract class JobDetailState {}

class JobDetailInitial extends JobDetailState {}

class JobDetailLoading extends JobDetailState {}

class JobDetailFailed extends JobDetailState {
  final String errorMessage;
  JobDetailFailed({required this.errorMessage});
}

class JobDetailLoaded extends JobDetailState{
  final JobDetail jobDetail;
  JobDetailLoaded({required this.jobDetail});
}