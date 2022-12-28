import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/education_params.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/features/education/domain/entities/education.dart';
import 'package:tieup/features/education/domain/use_cases/add_user_education.dart';
import 'package:tieup/features/education/domain/use_cases/get_user_education.dart';

part 'education_event.dart';
part 'education_state.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  GetUserEducation getUserEducation;
  AddUserEducation addUserEducation;

  EducationBloc(
      {required this.addUserEducation, required this.getUserEducation})
      : super(EducationInitial()) {
    on<GetUserEducationEvent>((event, emit) async {
      emit(EducationLoading());
      final eitherResponse = await getUserEducation(NoParams());
      emit(eitherResponse.fold(
          (failure) => EducationFailed(errorMessage: 'errorMessage'),
          (userEducation) => EducationLoaded(userEducation: userEducation)));
    });

    on<AddUserEducationEvent>((event, emit) async{
      emit(EducationLoading());
      final eitherResponse = await addUserEducation(event.params);
      emit(eitherResponse.fold(
              (failure) => EducationFailed(errorMessage: 'errorMessage'),
              (success) => EducationAddedSuccessfully()));
    });

  }
}
