import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/features/job/domain/entities/job.dart';
import 'package:tieup/features/job/domain/use_cases/get_applied_jobs.dart';
import 'package:tieup/features/job/domain/use_cases/get_company_jobs.dart';
import 'package:tieup/features/job/domain/use_cases/get_fav_jobs.dart';
import 'package:tieup/features/job/domain/use_cases/get_jobs.dart';
import 'package:tieup/features/job/domain/use_cases/get_suggest_jobs.dart';


part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  GetJobs getJobs;
  GetFavJobs getFavJobs;
  GetCompanyJobs getCompanyJobs;
  GetAppliedJobs getAppliedJobs;
  GetSuggestJobs getSuggestJobs;

  JobBloc(
      {required this.getJobs,
      required this.getFavJobs,
        required this.getAppliedJobs,
        required this.getSuggestJobs,
      required this.getCompanyJobs})
      : super(JobInitial()) {
    on<GetALlJobsEvent>((event, emit) async {
      emit(JobLoading());
      final eitherResponse = await getJobs(NoParams());
      emit(eitherResponse.fold(
          (failure) => JobFailed(errorMessage: 'errorMessage'),
          (jobs) => JobLoaded(jobs: jobs)));
    });

    on<GetCompanyJobsEvent>((event, emit) async {
      emit(JobLoading());
      final eitherResponse = await getCompanyJobs(Params(id: event.companyId));
      emit(eitherResponse.fold(
              (failure) => JobFailed(errorMessage: 'errorMessage'),
              (jobs) => JobLoaded(jobs: jobs)));
    });

    on<GetFavJobsEvent>((event, emit) async {
      emit(JobLoading());
      final eitherResponse = await getFavJobs(NoParams());
      emit(eitherResponse.fold(
          (failure) => JobFailed(errorMessage: 'errorMessage'),
          (jobs) => JobLoaded(jobs: jobs)));
    });

    on<GetAppliedJobsEvent>((event, emit) async {
      emit(JobLoading());
      final eitherResponse = await getAppliedJobs(NoParams());
      emit(eitherResponse.fold(
              (failure) => JobFailed(errorMessage: 'errorMessage'),
              (jobs) => JobLoaded(jobs: jobs)));
    });

    on<GetSuggestJobsEvent>((event, emit) async {
      emit(JobLoading());
      final eitherResponse = await getSuggestJobs(NoParams());
      emit(eitherResponse.fold(
              (failure) => JobFailed(errorMessage: 'errorMessage'),
              (jobs) => JobLoaded(jobs: jobs)));
    });
  }
}
