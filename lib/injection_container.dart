import 'package:tieup/features/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:tieup/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:tieup/features/authentication/domain/repositories/authentication_repositry.dart';
import 'package:tieup/features/authentication/domain/use_cases/login_user.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tieup/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tieup/features/loading/presentation/bloc/loading_cubit.dart';

import 'core/network/network_info.dart';

final sl = GetIt.I;

Future init() async {

  // bloc
  sl.registerFactory(() => AuthenticationBloc(loginUser: sl(), loadingCubit: sl()));
  sl.registerSingleton<LoadingCubit>(LoadingCubit());


  // use cases
  sl.registerLazySingleton(() => LoginUser(sl()));

  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()));

  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
