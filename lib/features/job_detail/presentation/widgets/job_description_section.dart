import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/constants/font_style.dart';

class JobDescriptionSection extends StatelessWidget {
  JobDescriptionSection({required this.title, required this.textList, Key? key})
      : super(key: key);
  String title;
  List<String> textList;

  @override
  Widget build(BuildContext context) {
    print(textList);
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
            child: Text(
              title,
              style: CustomFontStyle.titleStyle,
            ),
          ),
          ...List.generate(
              textList.length,
              (index) => Text(
                    '\u2022 ' ' ${textList[index].trim()} ',
                    softWrap: true,
                style: TextStyle(fontSize: 16),
                  )),
        ],
      ),
    );
  }
}
