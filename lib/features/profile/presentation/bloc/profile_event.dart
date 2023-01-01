part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetUserProfileEvent extends ProfileEvent{}


class UpdateUserImageEvent extends ProfileEvent{
  final ImageParams params;
  UpdateUserImageEvent({required this.params});
}