import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/constants.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({Key? key}) : super(key: key);

  List<String> skills = [
    'Flutter',
    'Git',
    'Teamwork',
    'Trello',
    'Dart',
    'Bloc state management',
    'Html',
    'CSS',
    'Slack',
    'BitBucket',
    'CI/CD',
  ]..sort((a, b) => a.length.compareTo(b.length));

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.w),
              child: Text(
                'Key Skills',
                style: CustomFontStyle.titleStyle,
              ),
            ),
            Wrap(
              spacing: 4.w,
              runSpacing: 4.w,
              direction: Axis.horizontal,
              children: List.generate(
                skills.length,
                (index) => Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: kPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(25.r)),
                    child: Text(
                      skills[index],
                    )
                    // child: const Center(child: Text('Team work',style: TextStyle(color: Colors.white),)),
                    ),
              ),
            ),
          ],
        ));
  }
}
