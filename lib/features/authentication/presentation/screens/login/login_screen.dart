import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/common/widgets/no_account_text.dart';
import 'package:tieup/common/widgets/social_card.dart';
import 'package:tieup/common/widgets/or_text.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/authentication/presentation/screens/login/login_form.dart';
import 'package:tieup/size_config.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = "/Login";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
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
                decoration:  BoxDecoration(
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
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
                    ),
                    SizedBox(height: 36.h),
                    LoginForm(),
                    SizedBox(height: 24.h),
                    const OrText(text: "OR login with"),
                    SizedBox(height: 12.h),
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
                    Spacer(flex : 1),
                    const NoAccountText(text1: 'New user?',text2: 'Register'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
