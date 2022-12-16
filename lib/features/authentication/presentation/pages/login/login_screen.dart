import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/widgets/no_account_text.dart';
import 'package:tieup/core/widgets/or_text.dart';
import 'package:tieup/core/widgets/social_card.dart';
import 'package:tieup/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tieup/features/authentication/presentation/pages/login/login_form.dart';
import 'package:tieup/features/authentication/presentation/pages/sign_up/sign_up_screen.dart';
import 'package:tieup/features/home/presentation/pages/screens/home_screen.dart';
import 'package:tieup/features/loading/presentation/bloc/loading_cubit.dart';
import 'package:tieup/features/loading/presentation/pages/loading_circle.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/Login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: SafeArea(child: BlocBuilder<LoadingCubit, bool>(
        builder: (context, shouldShow) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      //color: Colors.black,
                      margin: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        fit: BoxFit.contain,
                        'assets/images/logo.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26.0),
                          ),
                          SizedBox(height: 36.h),
                          LoginForm(),
                          BlocConsumer<AuthenticationBloc, AuthenticationState>(
                            listenWhen: (prev, current) =>
                                current is AuthenticationSuccess,
                            listener: (_, state) =>
                                Navigator.pushReplacementNamed(
                                    context, HomeScreen.routeName),
                            builder: (context, state) {
                              if (state is AuthenticationFailed)
                                return Text('error');
                              else
                                return SizedBox(height: 12.h);
                            },
                          ),
                          //SizedBox(height: 24.h),
                          const OrText(text: "OR login with"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SocialCard(
                                text: 'Facebook',
                                icon: 'assets/icons/facebook.svg',
                                press: () {},
                              ),
                              SocialCard(
                                text: 'Google',
                                icon: 'assets/icons/google-icon.svg',
                                press: () {},
                              )
                            ],
                          ),
                          //SizedBox(height: 36.h),
                          Spacer(flex: 1),
                          NoAccountText(
                              text1: 'New user?',
                              text2: 'Register',
                              onTap: () => Navigator.pushNamed(
                                  context, SignUpScreen.routeName)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              if (shouldShow)
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.7)),
                  child: Center(
                    child: LoadingCircle(
                      size: 200.w,
                    ),
                  ),
                ),
            ],
          );
        },
      )),
    );
  }
}
