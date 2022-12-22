import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/features/job_detail/domain/entities/job_detail.dart';
import 'package:tieup/features/job_detail/domain/use_cases/get_job_detail.dart';

part 'job_detail_event.dart';
part 'job_detail_state.dart';

class JobDetailBloc extends Bloc<JobDetailEvent, JobDetailState> {
  GetJobDetail getJobDetail;

  JobDetailBloc({required this.getJobDetail}) : super(JobDetailInitial()) {
    on<GetJobDetailEvent>((event, emit) async{
      emit(JobDetailLoading());
      final eitherResponse = await getJobDetail(event.jobId);
      emit(eitherResponse.fold((failure) => JobDetailFailed(errorMessage: 'errorMessage'),
              (jobDetail) => JobDetailLoaded(jobDetail: jobDetail)));
    });
  }
}
