part of 'apply_bloc.dart';

@immutable
abstract class ApplyState {}

class ApplyInitial extends ApplyState {}

class ApplyAddedSuccessfully extends ApplyState {
  final bool status;
  ApplyAddedSuccessfully({required this.status});
}

class ApplyAddedFailed extends ApplyState {
  final String errorMessage;
  ApplyAddedFailed({required this.errorMessage});
}
