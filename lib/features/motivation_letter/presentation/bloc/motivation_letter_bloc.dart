import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'motivation_letter_event.dart';
part 'motivation_letter_state.dart';

class MotivationLetterBloc extends Bloc<MotivationLetterEvent, MotivationLetterState> {
  MotivationLetterBloc() : super(MotivationLetterInitial()) {
    on<MotivationLetterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
