part of 'job_bloc.dart';

@immutable
abstract class JobState {}

class JobInitial extends JobState {}
class JobLoading extends JobState {}
class JobFailed extends JobState {
  final String errorMessage;
  JobFailed({required this.errorMessage});
}

class JobLoaded extends JobState{
  final List<Job> jobs;
  JobLoaded({required this.jobs});
}
