import 'package:flutter/material.dart';
import 'package:tieup/constants.dart';

class ClickableText extends StatelessWidget {
  ClickableText(this.text, {Key? key}) : super(key: key);

  String text = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Text(
          text,
        style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w600),
      ),
    );
  }
}
