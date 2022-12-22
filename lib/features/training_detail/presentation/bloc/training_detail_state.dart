part of 'training_detail_bloc.dart';

@immutable
abstract class TrainingDetailState {}

class TrainingDetailInitial extends TrainingDetailState {}

class TrainingDetailLoading extends TrainingDetailState {}

class TrainingDetailFailed extends TrainingDetailState {
  final String errorMessage;
  TrainingDetailFailed({required this.errorMessage});
}

class TrainingDetailLoaded extends TrainingDetailState{
  final TrainingDetail trainingDetail;
  TrainingDetailLoaded({required this.trainingDetail});
}