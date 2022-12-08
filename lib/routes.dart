import 'package:flutter/cupertino.dart';
import 'package:tieup/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:tieup/features/authentication/presentation/pages/sign_up/sign_up_screen.dart';
import 'package:tieup/features/home/presentation/pages/screens/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignUpScreen.routeName: (context) =>  SignUpScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};
