import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/constants/font_style.dart';



class CompanyBrief extends StatelessWidget {
  final String imageUrl;
  final String jobTitle;
  final String companyName;
  final String subDomainName;
  const CompanyBrief({
    required this.jobTitle,
    required this.companyName,
    required this.subDomainName,
    required this.imageUrl,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.network('$kBaseUrl/$imageUrl',
            width: 46.w,height: 46.w,),
          SizedBox(width: 8.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(jobTitle,style: CustomFontStyle.titleStyle,),
              SizedBox(height: 12.h,),
              Text(companyName),
            ],
          ),
         SizedBox(width: 6,),
         Text(subDomainName.trim()),
        ],
      ),
    );
  }
}
