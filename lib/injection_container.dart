import 'package:http/http.dart';
import 'package:tieup/features/application/data/data_sources/apply_remote_data_source.dart';
import 'package:tieup/features/application/data/repositories/apply_repository_impl.dart';
import 'package:tieup/features/application/domain/repositories/apply_repository.dart';
import 'package:tieup/features/application/domain/use_cases/apply.dart';
import 'package:tieup/features/application/presentation/manager/apply_bloc.dart';
import 'package:tieup/features/company/domain/use_cases/get_compnay_detail.dart';
import 'package:tieup/features/company/presentation/bloc/company_bloc.dart';
import 'package:tieup/features/education/data/data_sources/education_remote_data_source.dart';
import 'package:tieup/features/education/data/repositories/education_repository_impl.dart';
import 'package:tieup/features/education/domain/repositories/education_repository.dart';
import 'package:tieup/features/education/domain/use_cases/add_user_education.dart';
import 'package:tieup/features/education/domain/use_cases/get_user_education.dart';
import 'package:tieup/features/education/presentation/bloc/education_bloc.dart';
import 'package:tieup/features/favorite/data/data_sources/favorite_remote_data_source.dart';
import 'package:tieup/features/favorite/data/repositories/favorite_repository_impl.dart';
import 'package:tieup/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:tieup/features/favorite/domain/use_cases/add_to_fav.dart';
import 'package:tieup/features/favorite/presentation/manager/favorite_bloc.dart';
import 'package:tieup/features/job/domain/use_cases/get_applied_jobs.dart';
import 'package:tieup/features/job/domain/use_cases/get_company_jobs.dart';
import 'package:tieup/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:tieup/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:tieup/features/profile/domain/repositories/profile_repository.dart';
import 'package:tieup/features/profile/domain/use_cases/get_user_profile.dart';
import 'package:tieup/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:tieup/features/skill/data/data_sources/skill_remote_data_source.dart';
import 'package:tieup/features/skill/data/repositories/skill_repository_impl.dart';
import 'package:tieup/features/skill/domain/repositories/skill_repository.dart';
import 'package:tieup/features/skill/domain/use_cases/get_domains.dart';
import 'package:tieup/features/skill/domain/use_cases/get_skills.dart';
import 'package:tieup/features/skill/domain/use_cases/get_sub_domains.dart';
import 'package:tieup/features/skill/domain/use_cases/get_user_skills.dart';
import 'package:tieup/features/skill/presentation/Bloc/skill_bloc.dart';
import 'package:tieup/features/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:tieup/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:tieup/features/authentication/domain/repositories/authentication_repositry.dart';
import 'package:tieup/features/authentication/domain/use_cases/login_user.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tieup/features/authentication/domain/use_cases/signUp_user.dart';
import 'package:tieup/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tieup/features/company/data/data_sources/company_remote_data_source.dart';
import 'package:tieup/features/company/data/repositories/company_repository_impl.dart';
import 'package:tieup/features/company/domain/repositories/company_repository.dart';
import 'package:tieup/features/company/domain/use_cases/get_all_companies.dart';
import 'package:tieup/features/course/data/data_sources/course_remote_Data_source.dart';
import 'package:tieup/features/course/data/repositories/course_repository_impl.dart';
import 'package:tieup/features/course/domain/repositories/course_repository.dart';
import 'package:tieup/features/course/domain/use_cases/add_course.dart';
import 'package:tieup/features/course/domain/use_cases/get_courses.dart';
import 'package:tieup/features/course/presentation/bloc/course_bloc.dart';
import 'package:tieup/features/experience/data/data_sources/work_experience_remote_data_source.dart';
import 'package:tieup/features/experience/data/repositories/work_experience_repository_impl.dart';
import 'package:tieup/features/experience/domain/repositories/work_experience_repository.dart';
import 'package:tieup/features/experience/domain/use_cases/add_work_experience.dart';
import 'package:tieup/features/experience/domain/use_cases/get_work_experience.dart';
import 'package:tieup/features/experience/presentation/bloc/work_experience_bloc.dart';
import 'package:tieup/features/home/presentation/bloc/home_bloc.dart';
import 'package:tieup/features/job/data/data_sources/job_remote_data_source.dart';
import 'package:tieup/features/job/data/repositories/job_repository_impl.dart';
import 'package:tieup/features/job/domain/repositories/job_repository.dart';
import 'package:tieup/features/job/domain/use_cases/get_fav_jobs.dart';
import 'package:tieup/features/job/domain/use_cases/get_jobs.dart';
import 'package:tieup/features/job/presentation/bloc/job_bloc.dart';
import 'package:tieup/features/job_detail/data/data_sources/job_detail_remote_data_source.dart';
import 'package:tieup/features/job_detail/data/repositories/job_detail_repository_impl.dart';
import 'package:tieup/features/job_detail/domain/repositories/job_detail_repository.dart';
import 'package:tieup/features/job_detail/domain/use_cases/get_job_detail.dart';
import 'package:tieup/features/job_detail/presentation/bloc/job_detail_bloc.dart';
import 'package:tieup/features/languages/data/data_sources/languages_remote_data_source.dart';
import 'package:tieup/features/languages/data/repositories/languages_repository_impl.dart';
import 'package:tieup/features/languages/domain/repositories/langauges_repository.dart';
import 'package:tieup/features/languages/domain/use_cases/get_languages.dart';
import 'package:tieup/features/languages/domain/use_cases/add_language.dart';
import 'package:tieup/features/languages/presentation/bloc/languages_bloc.dart';
import 'package:tieup/features/loading/presentation/bloc/loading_cubit.dart';
import 'package:tieup/features/motivation_letter/data/data_sources/motivation_letter_remote_data_source.dart';
import 'package:tieup/features/motivation_letter/data/repositories/motivation_letter_repository_impl.dart';
import 'package:tieup/features/motivation_letter/domain/repositories/motivation_letter_repository.dart';
import 'package:tieup/features/motivation_letter/domain/use_cases/get_motivation_letter.dart';
import 'package:tieup/features/motivation_letter/domain/use_cases/update_motivation_letter.dart';
import 'package:tieup/features/motivation_letter/presentation/bloc/motivation_letter_bloc.dart';
import 'package:tieup/features/personal_information/data/data_sources/personal_information_remote_data_source.dart';
import 'package:tieup/features/personal_information/data/repositories/personal_information_repository_impl.dart';
import 'package:tieup/features/personal_information/domain/repositories/personal_information_repository.dart';
import 'package:tieup/features/personal_information/domain/use_cases/get_personal_information.dart';
import 'package:tieup/features/personal_information/domain/use_cases/update_personal_information.dart';
import 'package:tieup/features/personal_information/presentation/bloc/personal_information_bloc.dart';
import 'package:tieup/features/portfolio/data/data_sources/portfolio_repository_remote_data_source.dart';
import 'package:tieup/features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'package:tieup/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:tieup/features/portfolio/domain/use_cases/get_user_portfolio.dart';
import 'package:tieup/features/portfolio/domain/use_cases/update_user_portfolio.dart';
import 'package:tieup/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:tieup/features/training/data/data_sources/training_remote_data_source.dart';
import 'package:tieup/features/training/data/repositories/training_repository_impl.dart';
import 'package:tieup/features/training/domain/repositories/training_repository.dart';
import 'package:tieup/features/training/domain/use_cases/get_applied_trainings.dart';
import 'package:tieup/features/training/domain/use_cases/get_company_trainings.dart';
import 'package:tieup/features/training/domain/use_cases/get_fav_trainings.dart';
import 'package:tieup/features/training/domain/use_cases/get_trainings.dart';
import 'package:tieup/features/training/presentation/bloc/training_bloc.dart';
import 'package:tieup/features/training_detail/data/data_sources/training_detail_remote_data_source.dart';
import 'package:tieup/features/training_detail/data/repositories/job_detail_repository_impl.dart';
import 'package:tieup/features/training_detail/domain/repositories/training_detail_repository.dart';
import 'package:tieup/features/training_detail/domain/use_cases/get_training_detail.dart';
import 'package:tieup/features/training_detail/presentation/bloc/training_detail_bloc.dart';
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
        addLanguage: sl(),
      ));
  sl.registerFactory(() => SkillBloc(
      getDomains: sl(),
      getSkills: sl(),
      getSubDomains: sl(),
      getUserSkills: sl()));
  sl.registerSingleton<LoadingCubit>(LoadingCubit());
  sl.registerFactory(() =>
      WorkExperienceBloc(addWorkExperience: sl(), getWorkExperience: sl()));
  sl.registerFactory(() => CourseBloc(getCourses: sl(), addCourse: sl()));
  sl.registerFactory(() => JobBloc(
      getJobs: sl(),
      getFavJobs: sl(),
      getCompanyJobs: sl(),
      getAppliedJobs: sl()));
  sl.registerFactory(() => JobDetailBloc(getJobDetail: sl()));
  sl.registerFactory(() => TrainingBloc(
      getTrainings: sl(),
      getFavTrainings: sl(),
      getCompanyTrainings: sl(),
      getAppliedTrainings: sl()));
  sl.registerFactory(() => TrainingDetailBloc(getTrainingDetail: sl()));
  sl.registerFactory(() => HomeBloc(getCompanies: sl()));
  sl.registerFactory(() => MotivationLetterBloc(
      getMotivationLetter: sl(), updateMotivationLetter: sl()));
  sl.registerFactory(
      () => PortfolioBloc(getUserPortfolio: sl(), updateUserPortfolio: sl()));
  sl.registerFactory(() => ProfileBloc(getUserProfile: sl()));
  sl.registerFactory(() => CompanyBloc(getCompanyDetail: sl()));
  sl.registerFactory(
      () => EducationBloc(getUserEducation: sl(), addUserEducation: sl()));
  sl.registerFactory(() => FavoriteBloc(addToFavorite: sl()));
  sl.registerFactory(() => ApplyBloc(apply: sl()));

  // use cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => SignUpUser(sl()));
  sl.registerLazySingleton(() => GetPersonalInformation(sl()));
  sl.registerLazySingleton(() => UpdatePersonalInformation(sl()));
  sl.registerLazySingleton(() => GetLanguages(sl()));
  sl.registerLazySingleton(() => AddLanguage(sl()));
  sl.registerLazySingleton(() => GetDomains(sl()));
  sl.registerLazySingleton(() => GetSubDomains(sl()));
  sl.registerLazySingleton(() => GetSkills(sl()));
  sl.registerLazySingleton(() => AddWorkExperience(sl()));
  sl.registerLazySingleton(() => GetWorkExperience(sl()));
  sl.registerLazySingleton(() => GetCourses(sl()));
  sl.registerLazySingleton(() => GetJobs(sl()));
  sl.registerLazySingleton(() => GetFavJobs(sl()));
  sl.registerLazySingleton(() => GetFavTrainings(sl()));
  sl.registerLazySingleton(() => GetTrainings(sl()));
  sl.registerLazySingleton(() => GetJobDetail(sl()));
  sl.registerLazySingleton(() => GetTrainingDetail(sl()));
  sl.registerLazySingleton(() => GetAllCompanies(sl()));
  sl.registerLazySingleton(() => GetMotivationLetter(sl()));
  sl.registerLazySingleton(() => UpdateMotivationLetter(sl()));
  sl.registerLazySingleton(() => GetUserPortfolio(sl()));
  sl.registerLazySingleton(() => UpdateUserPortfolio(sl()));
  sl.registerLazySingleton(() => AddCourse(sl()));
  sl.registerLazySingleton(() => GetUserSkills(sl()));
  sl.registerLazySingleton(() => GetUserProfile(sl()));
  sl.registerLazySingleton(() => GetCompanyJobs(sl()));
  sl.registerLazySingleton(() => GetCompanyTrainings(sl()));
  sl.registerLazySingleton(() => GetCompanyDetail(sl()));
  sl.registerLazySingleton(() => GetUserEducation(sl()));
  sl.registerLazySingleton(() => AddUserEducation(sl()));
  sl.registerLazySingleton(() => AddToFav(sl()));
  sl.registerLazySingleton(() => Apply(sl()));
  sl.registerLazySingleton(() => GetAppliedJobs(sl()));
  sl.registerLazySingleton(() => GetAppliedTrainings(sl()));

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
  sl.registerLazySingleton<CourseRemoteDataSource>(
      () => CourseRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<JobRemoteDataSource>(
      () => JobRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<TrainingRemoteDataSource>(
      () => TrainingRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<JobDetailRemoteDataSource>(
      () => JobDetailRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<TrainingDetailRemoteDataSource>(
      () => TrainingDetailRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<CompanyRemoteDataSource>(
      () => CompanyRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<MotivationLetterRemoteDataSource>(
      () => MotivationLetterRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<PortfolioRemoteDataSource>(
      () => PortfolioRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<EducationRemoteDataSource>(
      () => EducationRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<FavoriteRemoteDataSource>(
      () => FavoriteRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ApplyRemoteDataSource>(
      () => ApplyRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()));
  sl.registerLazySingleton<PersonalInformationRepository>(
      () => PersonalInformationRepositoryImpl(sl()));
  sl.registerLazySingleton<LanguagesRepository>(
      () => LanguagesRepositoryImpl(sl()));
  sl.registerLazySingleton<SkillRepository>(() => SkillRepositoryImpl(sl()));
  sl.registerLazySingleton<WorkExperienceRepository>(
      () => WorkExperienceRepositoryImpl(sl()));
  sl.registerLazySingleton<CourseRepository>(() => CourseRepositoryImpl(sl()));
  sl.registerLazySingleton<JobRepository>(() => JobRepositoryImpl(sl()));
  sl.registerLazySingleton<TrainingRepository>(
      () => TrainingRepositoryImpl(sl()));
  sl.registerLazySingleton<JobDetailRepository>(
      () => JobDetailRepositoryImpl(sl()));
  sl.registerLazySingleton<TrainingDetailRepository>(
      () => TrainingDetailRepositoryImpl(sl()));
  sl.registerLazySingleton<CompanyRepository>(
      () => CompanyRepositoryImpl(sl()));
  sl.registerLazySingleton<MotivationLetterRepository>(
      () => MotivationLetterRepositoryImpl(sl()));
  sl.registerLazySingleton<PortfolioRepository>(
      () => PortfolioRepositoryImpl(sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(sl()));
  sl.registerLazySingleton<EducationRepository>(
      () => EducationRepositoryImpl(sl()));
  sl.registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(sl()));
  sl.registerLazySingleton<ApplyRepository>(() => ApplyRepositoryImpl(sl()));

  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
