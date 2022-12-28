import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/features/training/domain/entities/training.dart';
import 'package:tieup/features/training/domain/use_cases/get_company_trainings.dart';
import 'package:tieup/features/training/domain/use_cases/get_fav_trainings.dart';
import 'package:tieup/features/training/domain/use_cases/get_trainings.dart';

part 'training_event.dart';
part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  GetTrainings getTrainings;
  GetFavTrainings getFavTrainings;
  GetCompanyTrainings getCompanyTrainings;

  TrainingBloc({required this.getTrainings,
    required this.getCompanyTrainings,required this.getFavTrainings})
      : super(TrainingInitial()) {
    on<GetALlTrainingsEvent>((event, emit) async {
      emit(TrainingLoading());
      final eitherResponse = await getTrainings(NoParams());
      emit(eitherResponse.fold(
          (failure) => TrainingFailed(errorMessage: 'errorMessage'),
          (trainings) => TrainingLoaded(trainings: trainings)));
    });

    on<GetCompanyTrainingsEvent>((event, emit) async {
      emit(TrainingLoading());
      final eitherResponse = await getCompanyTrainings(Params(id: event.companyId));
      emit(eitherResponse.fold(
              (failure) => TrainingFailed(errorMessage: 'errorMessage'),
              (trainings) => TrainingLoaded(trainings: trainings)));
    });

    on<GetFavTrainingsEvent>((event, emit) async {
      emit(TrainingLoading());
      final eitherResponse = await getFavTrainings(NoParams());
      emit(eitherResponse.fold(
          (failure) => TrainingFailed(errorMessage: 'errorMessage'),
          (trainings) => TrainingLoaded(trainings: trainings)));
    });
  }
}
