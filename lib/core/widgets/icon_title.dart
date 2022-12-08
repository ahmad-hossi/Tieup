import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IconTitle extends StatelessWidget {
  const IconTitle(
      {Key? key,
      required this.iconPath,
      required this.title,
      required this.description})
      : super(key: key);
  final String iconPath, title, description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 4.w, 12.w, 4.w),
          child: SvgPicture.asset(
            iconPath,
            width: 20.w,
            height: 20.w,
            color: const Color.fromARGB(255, 181, 189, 199),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(title),
        ),
        //Spacer(flex: 1,),
        Expanded(flex: 4, child: Text(description)),
        //Spacer(flex: 9,),
      ],
    );
  }
}
