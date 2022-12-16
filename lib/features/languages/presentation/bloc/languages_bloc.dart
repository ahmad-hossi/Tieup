import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/features/languages/domain/entities/language.dart';
import 'package:tieup/features/languages/domain/use_cases/get_languages.dart';
import 'package:tieup/features/languages/domain/use_cases/update_languages.dart';

part 'languages_event.dart';
part 'languages_state.dart';

class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  GetLanguages getLanguages;
  UpdateLanguages updateLanguages;

  LanguagesBloc({required this.getLanguages, required this.updateLanguages})
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
  }
}
