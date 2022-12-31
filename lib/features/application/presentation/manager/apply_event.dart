part of 'apply_bloc.dart';

@immutable
abstract class ApplyEvent {}

class ApplyAddEvent extends ApplyEvent {
  final int id;
  final String type;
  ApplyAddEvent({required this.id, required this.type});
}
