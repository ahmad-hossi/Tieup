import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/features/motivation_letter/domain/use_cases/get_motivation_letter.dart';
import 'package:tieup/features/motivation_letter/domain/use_cases/update_motivation_letter.dart';

part 'motivation_letter_event.dart';
part 'motivation_letter_state.dart';

class MotivationLetterBloc extends Bloc<MotivationLetterEvent, MotivationLetterState> {
  GetMotivationLetter getMotivationLetter;
  UpdateMotivationLetter updateMotivationLetter;

  MotivationLetterBloc({required this.getMotivationLetter,
  required this.updateMotivationLetter}) : super(MotivationLetterInitial()) {
    on<GetMotivationLetterEvent>((event, emit) async{
      emit(MotivationLetterLoading());
      final eitherResponse = await getMotivationLetter(NoParams());
      emit(eitherResponse.fold((failure) => MotivationLetterFailed(errorMessage: 'error'),
              (motivationLetter) => MotivationLetterLoaded(motivationLetter: motivationLetter)));
    });

    on<UpdateMotivationLetterEvent>((event, emit) async{
      emit(MotivationLetterLoading());
      final eitherResponse = await updateMotivationLetter(event.text);
      emit(eitherResponse.fold((failure) => MotivationLetterFailed(errorMessage: 'error'),
              (motivationLetter) => MotivationLetterLoaded(motivationLetter: motivationLetter)));
    });
  }
}
