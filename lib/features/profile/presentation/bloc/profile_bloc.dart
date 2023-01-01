import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/image_params.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/features/profile/domain/entities/profile.dart';
import 'package:tieup/features/profile/domain/use_cases/get_user_profile.dart';
import 'package:tieup/features/profile/domain/use_cases/update_user_image.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetUserProfile getUserProfile;
  UpdateUserImage updateUserImage;

  ProfileBloc({required this.getUserProfile,required this.updateUserImage}) : super(ProfileInitial()) {
    on<GetUserProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final eitherResponse = await getUserProfile(NoParams());
      emit(eitherResponse.fold((l) => ProfileFailed(errorMessage: 'error'),
          (userProfile) => ProfileLoaded(userProfile: userProfile)));
    });

    on<UpdateUserImageEvent>((event, emit) async {
      final imageResponse = await updateUserImage(event.params);
      print(imageResponse);
      if(imageResponse.isRight())
      {
        final eitherResponse = await getUserProfile(NoParams());
        emit(eitherResponse.fold((l) => ProfileFailed(errorMessage: 'error'),
                (userProfile) => ProfileLoaded(userProfile: userProfile)));
      }
    });
  }


}
