part of 'personal_information_bloc.dart';

@immutable
abstract class PersonalInformationEvent {}

class GetPersonalInformationEvent extends PersonalInformationEvent {}

class UpdatePersonalInformationEvent extends PersonalInformationEvent {
  final PersonalInformationParams personalInformationParams;
  UpdatePersonalInformationEvent({required this.personalInformationParams});
}
