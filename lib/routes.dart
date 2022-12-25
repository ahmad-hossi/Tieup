import 'package:flutter/cupertino.dart';
import 'package:tieup/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:tieup/features/authentication/presentation/pages/sign_up/sign_up_screen.dart';
import 'package:tieup/features/course/presentation/pages/courses_screen.dart';
import 'package:tieup/features/cv/presentation/pages/app.dart';
import 'package:tieup/features/experience/presentation/pages/experience_screen.dart';
import 'package:tieup/features/home/presentation/pages/home_screen.dart';
import 'package:tieup/features/job/presentation/pages/fav_jobs_screen.dart';
import 'package:tieup/features/job/presentation/pages/job_screen.dart';
import 'package:tieup/features/languages/presentation/pages/languages_screen.dart';
import 'package:tieup/features/motivation_letter/presentation/pages/Motivation_letter_screen.dart';
import 'package:tieup/features/personal_information/presentation/pages/personal_information_screen.dart';
import 'package:tieup/features/portfolio/presentation/pages/portfolio_screen.dart';
import 'package:tieup/features/profile/presentation/pages/profile_screen.dart';
import 'package:tieup/features/skill/presentation/pages/skill_screen.dart';
import 'package:tieup/features/training/presentation/pages/fav_Trainings_screen.dart';
import 'package:tieup/features/training/presentation/pages/training_screen.dart';
import 'package:tieup/features/training_detail/presentation/pages/training_details.dart';



final Map<String, WidgetBuilder> routes = {
  SignUpScreen.routeName: (context) =>  SignUpScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  PersonalInformationScreen.routeName: (context) => const PersonalInformationScreen(),
  ExperienceScreen.routeName: (context) => const ExperienceScreen(),
  CoursesScreen.routeName: (context) => const CoursesScreen(),
  JobScreen.routeName: (context) => const JobScreen(),
  TrainingScreen.routeName: (context) => const TrainingScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  TrainingDetailScreen.routeName: (context) =>  TrainingDetailScreen(),
  FavJobsScreen.routeName: (context) =>  const FavJobsScreen(),
  FavTrainingsScreen.routeName: (context) =>  const FavTrainingsScreen(),
  MotivationLetterScreen.routeName: (context) =>  const MotivationLetterScreen(),
  PortfolioScreen.routeName: (context) =>  const PortfolioScreen(),
  LanguagesScreen.routeName: (context) =>  const LanguagesScreen(),
  SkillScreen.routeName: (context) =>  const SkillScreen(),
  ResumeScreen.routeName: (context) =>  const ResumeScreen(),
};
