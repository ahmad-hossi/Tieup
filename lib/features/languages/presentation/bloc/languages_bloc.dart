import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/languages_params.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/features/languages/domain/entities/language.dart';
import 'package:tieup/features/languages/domain/use_cases/get_languages.dart';
import 'package:tieup/features/languages/domain/use_cases/add_language.dart';

part 'languages_event.dart';
part 'languages_state.dart';

class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  GetLanguages getLanguages;
  AddLanguage addLanguage;

  LanguagesBloc({required this.getLanguages, required this.addLanguage})
      : super(LanguagesInitial()) {
    on<GetLanguagesEvent>((event, emit) async{
      emit(LanguagesLoading());
      final eitherResponse = await getLanguages(NoParams());
      print(eitherResponse);
      emit(eitherResponse.fold(
              (failure) => LanguagesFailed(errorMessage: 'error'),
              (languages) => LanguagesLoaded(
              languages: languages)));
    });

    on<AddLanguageEvent>((event , emit)async{
      final eitherResponse = await addLanguage(event.params);
      print(eitherResponse);
      emit(eitherResponse.fold(
              (failure) => LanguageAddedFailed('error'),
              (success) => LanguageAddedSuccessfully()));
    });
  }
}
