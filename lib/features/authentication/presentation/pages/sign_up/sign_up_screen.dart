import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/core/widgets/no_account_text.dart';
import 'package:tieup/core/widgets/or_text.dart';
import 'package:tieup/core/widgets/social_card.dart';
import 'package:tieup/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tieup/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:tieup/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:tieup/features/home/presentation/pages/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  static String routeName = "/sign_up";
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Register')),
        // resizeToAvoidBottomInset : false,
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (prev, current) => current is AuthenticationSuccess,
          listener: (context, state) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 18, 32, 18),
                //color: Colors.red,
                child: Form(
                  key: _formKey,
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
                      CustomTextFormField.name(
                          textEditingController: nameController),
                      SizedBox(height: 0.02.h),
                      CustomTextFormField.email(
                          textEditingController: emailController),
                      SizedBox(height: 0.02.h),
                      CustomTextFormField.phoneNum(
                          textEditingController: phoneNumberController),
                      SizedBox(height: 0.02.h),
                      CustomTextFormField.password(
                          textEditingController: passwordController),
                      SizedBox(height: 0.24.h),
                      DefaultButton(
                        text: 'Register',
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthenticationBloc>().add(SignUpEvent(
                                  fullName: nameController.text,
                                  email: emailController.text,
                                  phone: phoneNumberController.text,
                                  password: passwordController.text,
                                ));
                          }
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
                        onTap: () {},
                      ),
                      SizedBox(height: 28.h),
                      NoAccountText(
                        text1: 'Already a user?',
                        text2: 'Login',
                        onTap: () =>
                            Navigator.pushNamed(context, LoginScreen.routeName),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
