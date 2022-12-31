import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/fav_params.dart';
import 'package:tieup/features/favorite/domain/use_cases/add_to_fav.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  AddToFav addToFavorite;

  FavoriteBloc({required this.addToFavorite}) : super(FavoriteInitial()) {
    on<AddToFavoriteEvent>((event, emit) async {
      final eitherResponse =
          await addToFavorite(FavParams(id: event.id, type: event.type));
      print(eitherResponse);
      emit(eitherResponse.fold((l) => FavoriteAddedFailed(errorMessage: 'fail'),
              (status) => FavoriteAddedSuccessfully(status: status)));

    });
  }
}
