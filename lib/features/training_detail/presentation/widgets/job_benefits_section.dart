import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/core/constants/custom_icon.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/constants/font_style.dart';

class JobBenefitsSection extends StatelessWidget {
   JobBenefitsSection({Key? key}) : super(key: key);

  List<Map<String, dynamic>> generalInformation = [
    {
      'iconPath': CustomIcons.holiday,
      'title': '30 Paid Holidays',
    },
    {
      'iconPath': CustomIcons.meal,
      'title': 'Meal Allowance',
    },
    {
      'iconPath': CustomIcons.insurance,
      'title': 'Health Insurance',
    },
    {
      'iconPath': CustomIcons.education,
      'title': 'Gymnasium',
    },
    {
      'iconPath': CustomIcons.gym,
      'title': 'job style',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.w),
            child: Text(
              'Benefits & Perks',
              style: CustomFontStyle.titleStyle,
            ),
          ),
          ...List.generate(
            generalInformation.length,
            (index) => Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8.w, 12.w, 4.w),
                  child: SvgPicture.asset(
                    generalInformation[index]['iconPath'],
                    width: 28.w,
                    height: 28.w,
                    color: kPrimaryColor,
                  ),
                ),
                Expanded(
                  child: Text(generalInformation[index]['title'],),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
