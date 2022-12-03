import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/constant/font_style.dart';


class JobDescriptionSection extends StatelessWidget {
  JobDescriptionSection({required this.title, Key? key}) : super(key: key);
  String title ;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.w),
            child: Text(title,style: CustomFontStyle.titleStyle,),
          ),
          ...List.generate(5, (index) =>
           Text('\u2022 '' one year experiance ' ,softWrap: true,)
          ),
        ],
      ),
    );
  }
}
