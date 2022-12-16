import 'package:flutter/material.dart';
import 'package:tieup/features/authentication/presentation/pages/sign_up/sign_up_screen.dart';

import '../../constants.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    this.text1 = '',
    required this.text2,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text1,text2;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(
                fontSize: 16,
                color: kPrimaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
