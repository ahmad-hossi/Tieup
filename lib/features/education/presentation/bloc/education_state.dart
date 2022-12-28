part of 'education_bloc.dart';

@immutable
abstract class EducationState {}

class EducationInitial extends EducationState {}

class EducationLoading extends EducationState {}

class EducationLoaded extends EducationState {
  final List<Education> userEducation;
  EducationLoaded({required this.userEducation});
}

class EducationFailed extends EducationState {
  final String errorMessage;
  EducationFailed({required this.errorMessage});
}

class EducationAddedSuccessfully extends EducationState {}