import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/entities/work_experience_params.dart';
import 'package:tieup/features/experience/domain/entities/experience.dart';
import 'package:tieup/features/experience/domain/use_cases/add_work_experience.dart';
import 'package:tieup/features/experience/domain/use_cases/get_work_experience.dart';

part 'work_experience_event.dart';
part 'work_experience_state.dart';

class WorkExperienceBloc
    extends Bloc<WorkExperienceEvent, WorkExperienceState> {
  AddWorkExperience addWorkExperience;
  GetWorkExperience getWorkExperience;

  WorkExperienceBloc(
      {required this.addWorkExperience, required this.getWorkExperience})
      : super(WorkExperienceInitial()) {
    on<AddWorkExperienceEvent>((event, emit) async {
      emit(WorkExperienceLoading());
      final eitherResponse = await addWorkExperience(event.params);
      emit(eitherResponse.fold(
          (failure) => WorkExperienceFailed(errorMessage: 'error'),
          (worksExperience) => WorkExperienceAddedSuccessfully()));
    });
    on<GetWorkExperienceEvent>((event, emit) async {
      emit(WorkExperienceLoading());
      final eitherResponse = await getWorkExperience(NoParams());
      print(eitherResponse);
      emit(eitherResponse.fold(
          (failure) => WorkExperienceFailed(errorMessage: 'error'),
          (workExperienceList) =>
              WorkExperienceLoaded(worksExperience: workExperienceList)));
    });
  }
}
