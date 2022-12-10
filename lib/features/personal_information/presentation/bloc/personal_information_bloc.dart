import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/entities/update_pesrsonal_information_params.dart';
import 'package:tieup/features/personal_information/domain/entities/personal_information.dart';
import 'package:tieup/features/personal_information/domain/use_cases/get_personal_information.dart';
import 'package:tieup/features/personal_information/domain/use_cases/update_personal_information.dart';

part 'personal_information_event.dart';
part 'personal_information_state.dart';

class PersonalInformationBloc
    extends Bloc<PersonalInformationEvent, PersonalInformationState> {
  GetPersonalInformation getPersonalInformation;
  UpdatePersonalInformation updatePersonalInformation;

  PersonalInformationBloc(
      {required this.getPersonalInformation,
      required this.updatePersonalInformation})
      : super(PersonalInformationInitial()) {
    on<GetPersonalInformationEvent>((event, emit) async {
      emit(PersonalInformationLoading());
      final eitherResponse = await getPersonalInformation(NoParams());
      print(eitherResponse);
      emit(eitherResponse.fold(
          (failure) => PersonalInformationFailed(errorMessage: 'error'),
          (personalInformation) => PersonalInformationLoaded(
              personalInformation: personalInformation)));
    });
    on<UpdatePersonalInformationEvent>((event, emit) async {
      emit(PersonalInformationLoading());
      final eitherResponse =
          await updatePersonalInformation(event.personalInformationParams);
      print(eitherResponse);
      emit(eitherResponse.fold((failure) => PersonalInformationFailed(errorMessage: 'error'),
           (personalInformation) => PersonalInformationLoaded(
               personalInformation: personalInformation)));
    });
  }
}
