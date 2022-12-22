part of 'training_detail_bloc.dart';

@immutable
abstract class TrainingDetailEvent {}

class GetTrainingDetailEvent extends TrainingDetailEvent{
  final Params trainingId;
  GetTrainingDetailEvent({required this.trainingId});
}
