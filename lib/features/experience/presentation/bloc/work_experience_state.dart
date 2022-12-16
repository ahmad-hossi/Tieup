part of 'work_experience_bloc.dart';

@immutable
abstract class WorkExperienceState {}

class WorkExperienceInitial extends WorkExperienceState {}

class WorkExperienceLoading extends WorkExperienceState {}

class WorkExperienceLoaded extends WorkExperienceState {
  final List<Experience> worksExperience;
  WorkExperienceLoaded({required this.worksExperience});
}

class WorkExperienceFailed extends WorkExperienceState {
  final String errorMessage;
  WorkExperienceFailed({required this.errorMessage});
}

class WorkExperienceAddedSuccessfully extends WorkExperienceState {}


