import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tieup/size_config.dart';


class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenWidth(12)),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(18),
            vertical: getProportionateScreenWidth(12)),
        //height: getProportionateScreenHeight(40),
        //width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            //color: Color(0xFFF5F6F9),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
