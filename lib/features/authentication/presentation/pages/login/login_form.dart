import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/widgets/custom_suffix_icon.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tieup/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:tieup/features/loading/presentation/bloc/loading_cubit.dart';
import 'package:tieup/features/loading/presentation/bloc/loading_cubit.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomTextFormField.email(textEditingController: emailController),
          //buildMobileNumFormField(),
          SizedBox(height: 20.h),
          CustomTextFormField.password(
              textEditingController: passwordController),
          //buildPasswordFormField(),
          SizedBox(height: 8.h),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                "Forgot Password",
                style: TextStyle(
                    decoration: TextDecoration.underline, color: kPrimaryColor),
              ),
            ),
          ),
          SizedBox(height: 36.h),
          DefaultButton(
            text: "Login",
            press: () {
              print(emailController.text);
              context.read<AuthenticationBloc>().add(LoginEvent(
                  email: emailController.text,
                  password: passwordController.text));
              // if (_formKey.currentState!.validate()) {
              //   _formKey.currentState!.save();
              //
              //   // if all are valid then go to success screen
              //   //KeyboardUtil.hideKeyboard(context);
              // }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildMobileNumFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //onSaved: (newValue) => email = newValue ?? '',
      //validator: (value) {},
      decoration: InputDecoration(
        labelText: "Mobile Number",
        //hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.emailAddress,
      //onSaved: (newValue) => email = newValue ?? '',
      //validator: (value) {},
      decoration: InputDecoration(
        labelText: "Password",
        //hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
