import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/features/profile/domain/entities/profile.dart';
import 'package:tieup/features/profile/domain/use_cases/get_user_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetUserProfile getUserProfile;

  ProfileBloc({required this.getUserProfile}) : super(ProfileInitial()) {
    on<GetUserProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final eitherResponse = await getUserProfile(NoParams());
      emit(eitherResponse.fold((l) => ProfileFailed(errorMessage: 'error'),
          (userProfile) => ProfileLoaded(userProfile: userProfile)));
    });
  }
}
