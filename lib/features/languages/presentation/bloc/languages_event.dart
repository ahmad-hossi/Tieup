part of 'languages_bloc.dart';

@immutable
abstract class LanguagesEvent {}

class GetLanguagesEvent extends LanguagesEvent{}

class AddLanguageEvent extends LanguagesEvent{
  final LanguagesParams params;
  AddLanguageEvent({required this.params});
}




