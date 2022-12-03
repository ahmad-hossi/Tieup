import 'package:flutter/cupertino.dart';
import 'package:tieup/features/Home/presentation/screens/home_screen.dart';
import 'package:tieup/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:tieup/features/authentication/presentation/screens/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignUpScreen.routeName: (context) =>  SignUpScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};
