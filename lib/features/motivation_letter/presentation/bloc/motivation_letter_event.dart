part of 'motivation_letter_bloc.dart';

@immutable
abstract class MotivationLetterEvent {}

class GetMotivationLetterEvent extends MotivationLetterEvent{}

class UpdateMotivationLetterEvent extends MotivationLetterEvent{
  final String text;
  UpdateMotivationLetterEvent({required this.text});
}
