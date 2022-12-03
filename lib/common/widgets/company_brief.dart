import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/constant/font_style.dart';


class CompanyBrief extends StatelessWidget {
  const CompanyBrief({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset('assets/images/google_logo.png',
            width: 38.w,height: 38.w,),
          SizedBox(width: 8.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Product Design',style: CustomFontStyle.titleStyle,),
              SizedBox(height: 4.h,),
              Text('Google'),
            ],
          ),
          //Spacer(),
          Text('Frontend Devloper'),
        ],
      ),
    );
  }
}
