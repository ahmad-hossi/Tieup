import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/application/presentation/manager/apply_bloc.dart';
import 'package:tieup/features/company/presentation/bloc/company_bloc.dart';
import 'package:tieup/features/education/presentation/bloc/education_bloc.dart';
import 'package:tieup/features/favorite/presentation/manager/favorite_bloc.dart';
import 'package:tieup/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:tieup/features/skill/presentation/Bloc/skill_bloc.dart';
import 'package:tieup/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tieup/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:tieup/features/course/presentation/bloc/course_bloc.dart';
import 'package:tieup/features/experience/presentation/bloc/work_experience_bloc.dart';
import 'package:tieup/features/home/presentation/bloc/home_bloc.dart';
import 'package:tieup/features/home/presentation/pages/home_screen.dart';
import 'package:tieup/features/job/presentation/bloc/job_bloc.dart';
import 'package:tieup/features/job_detail/presentation/bloc/job_detail_bloc.dart';
import 'package:tieup/features/languages/presentation/bloc/languages_bloc.dart';
import 'package:tieup/features/loading/presentation/bloc/loading_cubit.dart';
import 'package:tieup/features/motivation_letter/presentation/bloc/motivation_letter_bloc.dart';
import 'package:tieup/features/personal_information/presentation/bloc/personal_information_bloc.dart';
import 'package:tieup/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:tieup/features/training/presentation/bloc/training_bloc.dart';
import 'package:tieup/features/training_detail/presentation/bloc/training_detail_bloc.dart';
import 'package:tieup/injection_container.dart';
import 'package:tieup/routes.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(di.init());
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  runApp(MyApp(
    openHome: token == null ? false : true,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({this.openHome = false, Key? key}) : super(key: key);

  final bool openHome;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<AuthenticationBloc>()),
            BlocProvider(create: (_) => sl<LoadingCubit>()),
            BlocProvider(create: (_) => sl<PersonalInformationBloc>()),
            BlocProvider(create: (_) => sl<LanguagesBloc>()),
            BlocProvider(create: (_) => sl<SkillBloc>()),
            BlocProvider(create: (_) => sl<WorkExperienceBloc>()),
            BlocProvider(create: (_) => sl<CourseBloc>()),
            BlocProvider(create: (_) => sl<JobBloc>()),
            BlocProvider(create: (_) => sl<TrainingBloc>()),
            BlocProvider(create: (_) => sl<JobDetailBloc>()),
            BlocProvider(create: (_) => sl<TrainingDetailBloc>()),
            BlocProvider(create: (_) => sl<HomeBloc>()),
            BlocProvider(create: (_) => sl<MotivationLetterBloc>()),
            BlocProvider(create: (_) => sl<PortfolioBloc>()),
            BlocProvider(create: (_) => sl<ProfileBloc>()),
            BlocProvider(create: (_) => sl<CompanyBloc>()),
            BlocProvider(create: (_) => sl<EducationBloc>()),
            BlocProvider(create: (_) => sl<FavoriteBloc>()),
            BlocProvider(create: (_) => sl<ApplyBloc>()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: Color(0xFFF8F8F8),
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Color(0xFF364965),
                  fontSize: 24,
                ),
              ),
              // primarySwatch: const MaterialColor(0x3E58CC,<int,Color>{
              //   400:Color(0x00455fcf),
              //   300:Color(0x006378d5),
              //   200:Color(0x009aa8e4),
              //   100:Color(0x00d4dbf4),
              // }),
              primaryColor: kPrimaryColor,
              //useMaterial3: true,
              // fontFamily: 'Gilroy'
            ),
            home: LoginScreen(),
            // routes: routes,
            // initialRoute:
            //     openHome ? HomeScreen.routeName : LoginScreen.routeName,
          ),
        );
      },
    );
  }
}
