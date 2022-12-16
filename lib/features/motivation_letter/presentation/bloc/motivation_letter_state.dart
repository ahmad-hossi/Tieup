part of 'motivation_letter_bloc.dart';

@immutable
abstract class MotivationLetterState {}

class MotivationLetterInitial extends MotivationLetterState {}

class MotivationLetterLoading extends MotivationLetterState {}

class MotivationLetterLoaded extends MotivationLetterState {
  final String motivationLetter;
  MotivationLetterLoaded({required this.motivationLetter});
}

class MotivationLetterFailed extends MotivationLetterState {
  final String errorMessage;
  MotivationLetterFailed({required this.errorMessage});
}
