import 'package:http/http.dart';
import 'package:tieup/features/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:tieup/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:tieup/features/authentication/domain/repositories/authentication_repositry.dart';
import 'package:tieup/features/authentication/domain/use_cases/login_user.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tieup/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tieup/features/loading/presentation/bloc/loading_cubit.dart';
import 'package:tieup/features/personal_information/data/data_sources/personal_information_remote_data_source.dart';
import 'package:tieup/features/personal_information/data/repositories/personal_information_repository_impl.dart';
import 'package:tieup/features/personal_information/domain/repositories/personal_information_repository.dart';

import 'package:tieup/features/personal_information/domain/use_cases/get_personal_information.dart';
import 'package:tieup/features/personal_information/domain/use_cases/update_personal_information.dart';
import 'package:tieup/features/personal_information/presentation/bloc/personal_information_bloc.dart';

import 'core/network/network_info.dart';

final sl = GetIt.I;

Future init() async {
  // bloc
  sl.registerFactory(
      () => AuthenticationBloc(loginUser: sl(), loadingCubit: sl()));
  sl.registerFactory(() => PersonalInformationBloc(
      getPersonalInformation: sl(), updatePersonalInformation: sl()));
  sl.registerSingleton<LoadingCubit>(LoadingCubit());

  // use cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => GetPersonalInformation(sl()));
  sl.registerLazySingleton(() => UpdatePersonalInformation(sl()));

  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<PersonalInformationRemoteDataSource>(
      () => PersonalInformationRemoteDateSourceImpl(client: sl()));

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()));
  sl.registerLazySingleton<PersonalInformationRepository>(
      () => PersonalInformationRepositoryImpl(sl()));

  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
