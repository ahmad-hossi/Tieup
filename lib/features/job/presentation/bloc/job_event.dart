part of 'job_bloc.dart';

@immutable
abstract class JobEvent {}

class GetALlJobsEvent extends JobEvent{}

class GetFavJobsEvent extends JobEvent{}
