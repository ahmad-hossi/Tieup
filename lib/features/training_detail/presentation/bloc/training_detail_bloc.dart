import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/features/training_detail/domain/entities/training_detail.dart';
import 'package:tieup/features/training_detail/domain/use_cases/get_training_detail.dart';

part 'training_detail_event.dart';
part 'training_detail_state.dart';

class TrainingDetailBloc
    extends Bloc<TrainingDetailEvent, TrainingDetailState> {
  GetTrainingDetail getTrainingDetail;

  TrainingDetailBloc({required this.getTrainingDetail})
      : super(TrainingDetailInitial()) {
    on<GetTrainingDetailEvent>((event, emit) async {
      emit(TrainingDetailLoading());
      final eitherResponse = await getTrainingDetail(event.trainingId);
      emit(eitherResponse.fold(
          (failure) => TrainingDetailFailed(errorMessage: 'errorMessage'),
          (trainingDetail) =>
              TrainingDetailLoaded(trainingDetail: trainingDetail)));
    });
  }
}
