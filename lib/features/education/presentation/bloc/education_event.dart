part of 'education_bloc.dart';

@immutable
abstract class EducationEvent {}

class GetUserEducationEvent extends EducationEvent{}

class AddUserEducationEvent extends EducationEvent{
  final EducationParams params;
  AddUserEducationEvent({required this.params});
}