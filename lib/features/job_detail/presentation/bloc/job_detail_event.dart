part of 'job_detail_bloc.dart';

@immutable
abstract class JobDetailEvent {}

class GetJobDetailEvent extends JobDetailEvent{
  final Params jobId;
  GetJobDetailEvent({required this.jobId});
}
