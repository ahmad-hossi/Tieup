import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/features/company/domain/entities/company.dart';
import 'package:tieup/features/company/domain/use_cases/get_all_companies.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetAllCompanies getCompanies;

  HomeBloc({required this.getCompanies}) : super(HomeInitial()) {
    on<GetAllCompaniesEvent>((event, emit) async{
      emit(HomeCompanyLoading());
      final eitherResponse =await getCompanies(NoParams());
      emit(eitherResponse.fold((failure) => HomeCompanyFailed('errorMessage'),
              (companies) => HomeCompanyLoaded(companies: companies)));
    });
  }
}
