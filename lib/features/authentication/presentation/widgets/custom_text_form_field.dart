import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({Key? key}) : super(key: key);
  CustomTextFormField.email({Key? key, required this.email})
      : textInputType = TextInputType.emailAddress,
        label = 'Email',
        super(key: key);
  CustomTextFormField.password({Key? key, required this.password})
      : textInputType = TextInputType.visiblePassword,
        label = 'Password',
        obscureText = true,
       super(key: key);
  CustomTextFormField.phoneNum({Key? key, required this.phoneNum})
      : textInputType = TextInputType.phone,
        label = 'Mobile No.',
        super(key: key);
  CustomTextFormField.name({Key? key, required this.name})
      : textInputType = TextInputType.name,
        label = 'Full name',
        super(key: key);

  late String phoneNum, name, password, email;
  late TextInputType textInputType;
  late String label ;
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        //hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
