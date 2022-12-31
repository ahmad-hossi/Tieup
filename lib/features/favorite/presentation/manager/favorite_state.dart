part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteAddedSuccessfully extends FavoriteState {
  final bool status;
  FavoriteAddedSuccessfully({required this.status});
}

class FavoriteAddedFailed extends FavoriteState {
  final String errorMessage;
  FavoriteAddedFailed({required this.errorMessage});
}
