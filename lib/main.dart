import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tieup/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:tieup/features/home/presentation/pages/screens/home_screen.dart';
import 'package:tieup/features/loading/presentation/bloc/loading_cubit.dart';
import 'package:tieup/features/personal_information/presentation/bloc/personal_information_bloc.dart';
import 'package:tieup/injection_container.dart';
import 'package:tieup/routes.dart';
import 'injection_container.dart' as di;

void main() {
  unawaited(di.init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
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
            //home: HomeScreen(),
            routes: routes,
            initialRoute: LoginScreen.routeName,
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/logo.png')),
          const CircularProgressIndicator(color: Colors.indigo),
        ],
      ),
    );
  }
}
