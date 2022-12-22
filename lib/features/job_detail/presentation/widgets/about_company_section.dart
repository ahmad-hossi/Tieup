import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/core/widgets/cashedImage.dart';
import 'package:tieup/core/widgets/clickable_text.dart';

class AboutCompanySection extends StatelessWidget {
  const AboutCompanySection(
      {required this.companyName,
      required this.companyImageUrl,
      required this.companyDesc,
      Key? key})
      : super(key: key);

  final String companyName;
  final String companyImageUrl;
  final String companyDesc;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12.w),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'About Company',
              style: CustomFontStyle.titleStyle,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.w),
              child: Row(
                children: [
                  CashedImage(
                    url: companyImageUrl,
                    height: 38,
                    width: 38,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(companyName,style: TextStyle(fontSize: 22),)
                ],
              ),
            ),
            Text(
                companyDesc,
                softWrap: true),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: ClickableText('Know more'),
            ),
          ],
        ));
  }
}
