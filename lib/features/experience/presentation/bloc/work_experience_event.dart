part of 'work_experience_bloc.dart';

@immutable
abstract class WorkExperienceEvent {}

class GetWorkExperienceEvent extends WorkExperienceEvent{}

class AddWorkExperienceEvent extends WorkExperienceEvent{
  final WorkExperienceParams params;
  AddWorkExperienceEvent({required this.params});
}
