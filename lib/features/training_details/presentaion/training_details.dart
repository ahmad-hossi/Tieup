import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/constants/custom_icon.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/job_details/presentaition/widgets/about_company_section.dart';
import 'package:tieup/features/job_details/presentaition/widgets/general_section.dart';
import 'package:tieup/features/job_details/presentaition/widgets/job_description_section.dart';
import 'package:tieup/features/job_details/presentaition/widgets/skills_section.dart';

class TrainingDetails extends StatelessWidget {
  TrainingDetails({Key? key}) : super(key: key);

  List <Map<String,dynamic>> generalInformation = [
    {'iconPath':CustomIcons.location,'title':'city','description' :'Aleepo '},
    {'iconPath':CustomIcons.dollar,'title':'Cost','description' :'50 \$'},
    {'iconPath':CustomIcons.share,'title':'start date','description' :'2022/9/9'},
    {'iconPath':CustomIcons.share,'title':'end date','description' :'2022/10/9'},
    {'iconPath':CustomIcons.share,'title':'registration date','description' :'2022/9/10'},
    {'iconPath':CustomIcons.profile,'title':'Vacancies ','description' :'12'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              GeneralSection(generalInformation: generalInformation),
              SizedBox(
                height: 8.h,
              ),
              SkillsSection(),
              SizedBox(
                height: 8.h,
              ),
              JobDescriptionSection(title: 'Training Description'),
              SizedBox(
                height: 8.h,
              ),
              JobDescriptionSection(title: 'Training Requirements'),
              SizedBox(
                height: 8.h,
              ),
              AboutCompanySection(),
              //geographySection()
              Container(
                color: Colors.white,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: DefaultButton(text: 'Apply', press: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
