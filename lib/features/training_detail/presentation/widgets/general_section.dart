import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/widgets/company_brief.dart';
import 'package:tieup/core/widgets/icon_title.dart';

class GeneralSection extends StatelessWidget {
  GeneralSection({required this.generalInformation, Key? key})
      : super(key: key);
  List<Map<String, dynamic>> generalInformation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //CompanyBrief(),
          ...List.generate(
            generalInformation.length,
            (index) => IconTitle(
              iconPath: generalInformation[index]['iconPath'],
              title: generalInformation[index]['title'],
              description: generalInformation[index]['description'],
            ),
          ),
        ],
      ),
    );
  }
}
