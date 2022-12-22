part of 'training_bloc.dart';

@immutable
abstract class TrainingState {}

class TrainingInitial extends TrainingState {}
class TrainingLoading extends TrainingState {}
class TrainingFailed extends TrainingState {
  final String errorMessage;
  TrainingFailed({required this.errorMessage});
}

class TrainingLoaded extends TrainingState{
  final List<Training> trainings;
  TrainingLoaded({required this.trainings});
}
