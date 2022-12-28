import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/features/company/domain/entities/company_detail.dart';
import 'package:tieup/features/company/domain/use_cases/get_compnay_detail.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  GetCompanyDetail getCompanyDetail;

  CompanyBloc({required this.getCompanyDetail}) : super(CompanyInitial()) {
    on<GetCompanyDetailEvent>((event, emit) async {
      emit(CompanyLoading());
      final eitherResponse =
          await getCompanyDetail(Params(id: event.companyId));
      emit(eitherResponse.fold(
          (failure) => CompanyFailed(errorMessage: 'errorMessage'),
          (companyDetail) => CompanyLoaded(companyDetail: companyDetail)));
    });
  }
}
