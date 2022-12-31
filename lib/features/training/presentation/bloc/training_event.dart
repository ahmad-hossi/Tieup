part of 'training_bloc.dart';

@immutable
abstract class TrainingEvent {}

class GetALlTrainingsEvent extends TrainingEvent{}

class GetCompanyTrainingsEvent extends TrainingEvent{
  final int companyId;
  GetCompanyTrainingsEvent({required this.companyId});
}

class GetFavTrainingsEvent extends TrainingEvent{}

class GetAppliedTrainingsEvent extends TrainingEvent{}