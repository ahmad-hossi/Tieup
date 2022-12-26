part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile userProfile;
  ProfileLoaded({required this.userProfile});
}

class ProfileFailed extends ProfileState {
  final String errorMessage;
  ProfileFailed({required this.errorMessage});
}

