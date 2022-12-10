part of 'personal_information_bloc.dart';

@immutable
abstract class PersonalInformationState {}

class PersonalInformationInitial extends PersonalInformationState {}
class PersonalInformationLoading extends PersonalInformationState {}
class PersonalInformationLoaded extends PersonalInformationState {
   final PersonalInformation personalInformation;
   PersonalInformationLoaded({required this.personalInformation});
}

class PersonalInformationFailed extends PersonalInformationState {
   final String errorMessage;
   PersonalInformationFailed({required this.errorMessage});
}