part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class AddToFavoriteEvent extends FavoriteEvent {
  final int id;
  final String type;
  AddToFavoriteEvent({required this.id, required this.type});
}
