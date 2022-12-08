import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            EdgeInsets.symmetric(horizontal: 10.w,vertical: 12.h),
        padding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 12.h),
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
              width: 10.w,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
