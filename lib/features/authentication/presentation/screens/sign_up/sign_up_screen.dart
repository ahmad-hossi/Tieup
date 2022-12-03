import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/common/widgets/default_button.dart';
import 'package:tieup/common/widgets/no_account_text.dart';
import 'package:tieup/common/widgets/or_text.dart';
import 'package:tieup/common/widgets/social_card.dart';
import 'package:tieup/features/authentication/presentation/screens/otp/otp_screen.dart';
import 'package:tieup/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:tieup/size_config.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  static String routeName = "/sign_up";
  String email = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Register')),
        // resizeToAvoidBottomInset : false,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 18, 32, 18),
              //color: Colors.red,
              child: Column(
                children: [
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: const OrText(),
                  ),
                  SizedBox(height: 12.h),
                  CustomTextFormField.name(name: 'name'),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  CustomTextFormField.email(email: 'email'),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  CustomTextFormField.phoneNum(phoneNum: 'phoneNum'),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  CustomTextFormField.password(password: 'password'),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  DefaultButton(
                    text: 'Register',
                    press: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                    },
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'By clicking register, you agree to our',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 4.h),
                  NoAccountText(
                    text2: 'Terms and conditions',
                  ),
                  SizedBox(height: 28.h),
                  NoAccountText(
                    text1: 'Already a user?',
                    text2: 'Login',
                  ),
                ],
              )),
        ),
      ),
    );
  }

}
