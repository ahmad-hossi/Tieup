import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/fav_params.dart';
import 'package:tieup/features/application/domain/use_cases/apply.dart';

part 'apply_event.dart';
part 'apply_state.dart';

class ApplyBloc extends Bloc<ApplyEvent, ApplyState> {
  Apply apply;

  ApplyBloc({required this.apply}) : super(ApplyInitial()) {
    on<ApplyAddEvent>((event, emit) async {
      final eitherResponse =
          await apply(FavParams(id: event.id, type: event.type));
      print(eitherResponse);
      emit(eitherResponse.fold((l) => ApplyAddedFailed(errorMessage: 'fail'),
              (status) => ApplyAddedSuccessfully(status: status)));

    });
  }
}
