part of 'languages_bloc.dart';

@immutable
abstract class LanguagesState {}

class LanguagesInitial extends LanguagesState {}

class LanguagesLoading extends LanguagesState {}

class LanguagesLoaded extends LanguagesState {
  final List<Language> languages;
  LanguagesLoaded({required this.languages});
}

class LanguagesFailed extends LanguagesState {
  final String errorMessage;
  LanguagesFailed({required this.errorMessage});
}

class LanguageAddedSuccessfully extends LanguagesState {}

class LanguageAddedFailed extends LanguagesState {
  final String errorMessage;
  LanguageAddedFailed(this.errorMessage);
}