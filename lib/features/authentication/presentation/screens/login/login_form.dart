import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/common/widgets/custom_suffix_icon.dart';
import 'package:tieup/common/widgets/default_button.dart';
import 'package:tieup/constants.dart';


class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(

        mainAxisSize: MainAxisSize.max,
        children: [
          buildMobileNumFormField(),
          SizedBox(height: 20.h),
          buildPasswordFormField(),
          SizedBox(height: 8.h),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                "Forgot Password",
                style: TextStyle(decoration: TextDecoration.underline,color: kPrimaryColor),
              ),
            ),
          ),
          SizedBox(height: 36.h),
          DefaultButton(
            text: "Login",
            press: () {

              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
               // KeyboardUtil.hideKeyboard(context);
             //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),

    );
  }

  TextFormField buildMobileNumFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue?? '',
      validator: (value) {
      },
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
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue?? '',
      validator: (value) {
      },
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


