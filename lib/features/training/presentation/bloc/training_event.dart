part of 'training_bloc.dart';

@immutable
abstract class TrainingEvent {}

class GetALlTrainingsEvent extends TrainingEvent{}

class GetFavTrainingsEvent extends TrainingEvent{}
