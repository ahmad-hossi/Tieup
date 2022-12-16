import 'package:flutter/cupertino.dart';
import 'package:tieup/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:tieup/features/authentication/presentation/pages/sign_up/sign_up_screen.dart';
import 'package:tieup/features/experience/presentation/pages/experience_screen.dart';
import 'package:tieup/features/home/presentation/pages/screens/home_screen.dart';
import 'package:tieup/features/personal_information/presentation/pages/personal_information_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignUpScreen.routeName: (context) =>  SignUpScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  PersonalInformationScreen.routeName: (context) => const PersonalInformationScreen(),
  ExperienceScreen.routeName: (context) => const ExperienceScreen(),
};
