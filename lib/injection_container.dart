import 'package:http/http.dart';
import 'package:tieup/features/add_skills/data/data_sources/skill_remote_data_source.dart';
import 'package:tieup/features/add_skills/data/repositories/skill_repository_impl.dart';
import 'package:tieup/features/add_skills/domain/repositories/skill_repository.dart';
import 'package:tieup/features/add_skills/domain/use_cases/get_domains.dart';
import 'package:tieup/features/add_skills/domain/use_cases/get_skills.dart';
import 'package:tieup/features/add_skills/domain/use_cases/get_sub_domains.dart';
import 'package:tieup/features/add_skills/presentation/Bloc/skill_bloc.dart';
import 'package:tieup/features/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:tieup/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:tieup/features/authentication/domain/repositories/authentication_repositry.dart';
import 'package:tieup/features/authentication/domain/use_cases/login_user.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tieup/features/authentication/domain/use_cases/signUp_user.dart';
import 'package:tieup/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tieup/features/experience/data/data_sources/work_experience_remote_data_source.dart';
import 'package:tieup/features/experience/data/repositories/work_experience_repository_impl.dart';
import 'package:tieup/features/experience/domain/repositories/work_experience_repository.dart';
import 'package:tieup/features/experience/domain/use_cases/add_work_experience.dart';
import 'package:tieup/features/experience/domain/use_cases/get_work_experience.dart';
import 'package:tieup/features/experience/presentation/bloc/work_experience_bloc.dart';
import 'package:tieup/features/languages/data/data_sources/languages_remote_data_source.dart';
import 'package:tieup/features/languages/data/repositories/languages_repository_impl.dart';
import 'package:tieup/features/languages/domain/repositories/langauges_repository.dart';
import 'package:tieup/features/languages/domain/use_cases/get_languages.dart';
import 'package:tieup/features/languages/domain/use_cases/update_languages.dart';
import 'package:tieup/features/languages/presentation/bloc/languages_bloc.dart';
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
  sl.registerFactory(() => AuthenticationBloc(
      loginUser: sl(), signUpUser: sl(), loadingCubit: sl()));
  sl.registerFactory(() => PersonalInformationBloc(
      getPersonalInformation: sl(), updatePersonalInformation: sl()));
  sl.registerFactory(() => LanguagesBloc(
        getLanguages: sl(),
        updateLanguages: sl(),
      ));
  sl.registerFactory(
      () => SkillBloc(getDomains: sl(), getSkills: sl(), getSubDomains: sl()));
  sl.registerSingleton<LoadingCubit>(LoadingCubit());
  sl.registerFactory(
          () => WorkExperienceBloc(addWorkExperience: sl(),getWorkExperience: sl()));

  // use cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => SignUpUser(sl()));
  sl.registerLazySingleton(() => GetPersonalInformation(sl()));
  sl.registerLazySingleton(() => UpdatePersonalInformation(sl()));
  sl.registerLazySingleton(() => GetLanguages(sl()));
  sl.registerLazySingleton(() => UpdateLanguages(sl()));
  sl.registerLazySingleton(() => GetDomains(sl()));
  sl.registerLazySingleton(() => GetSubDomains(sl()));
  sl.registerLazySingleton(() => GetSkills(sl()));
  sl.registerLazySingleton(() => AddWorkExperience(sl()));
  sl.registerLazySingleton(() => GetWorkExperience(sl()));

  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<PersonalInformationRemoteDataSource>(
      () => PersonalInformationRemoteDateSourceImpl(client: sl()));
  sl.registerLazySingleton<LanguagesRemoteDataSource>(
      () => LanguagesRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<SkillRemoteDataSource>(
      () => SkillRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<WorkExperienceRemoteDataSource>(
          () => WorkExperienceRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()));
  sl.registerLazySingleton<PersonalInformationRepository>(
      () => PersonalInformationRepositoryImpl(sl()));
  sl.registerLazySingleton<LanguagesRepository>(
      () => LanguagesRepositoryImpl(sl()));
  sl.registerLazySingleton<SkillRepository>(() => SkillRepositoryImpl(sl()));
  sl.registerLazySingleton<WorkExperienceRepository>(() => WorkExperienceRepositoryImpl(sl()));

  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
