import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/skill/domain/entities/skill.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({required this.skills,Key? key}) :

        super(key: key);

  List<Skill> skills ;
  // = [
  // ]..sort((a, b) => a.length.compareTo(b.length));

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
                      skills[index].name,
                    )
                    // child: const Center(child: Text('Team work',style: TextStyle(color: Colors.white),)),
                    ),
              ),
            ),
          ],
        ));
  }
}
