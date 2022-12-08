import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/core/widgets/cashedImage.dart';
import 'package:tieup/core/widgets/clickable_text.dart';

class AboutCompanySection extends StatelessWidget {
  const AboutCompanySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      color: Colors.white,
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('About Company',style: CustomFontStyle.titleStyle,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.w),
            child: Row(children: [
              CashedImage(height: 38,width: 38,),
              SizedBox(width: 8.w,),
              Text('Microsoft')
            ],),
          ),
          Text("Microsoft Corporation is an American multinational "
              "technology corporation which produces computer software,"
              " consumer electronics, personal computers, and related services"
              " headquartered at the Microsoft Redmond campus located in Redmond, "
              "Washington, United States. Its best-known software products are the"
              " Windows line of operating systems, the Microsoft Office suite, and "
              "the Internet Explorer and Edge web browsers. Its flagship hardware "
              "products are the Xbox video game consoles and the Microsoft Surface"
              ,softWrap: true),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.w),
            child: ClickableText('Know more'),
          ),

        ],
      )
    );
  }
}
