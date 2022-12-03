import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/common/widgets/default_button.dart';
import 'package:tieup/constant/custom_icon.dart';
import 'package:tieup/constant/font_style.dart';
import 'package:tieup/features/job_details/presentaition/widgets/about_company_section.dart';
import 'package:tieup/features/job_details/presentaition/widgets/general_section.dart';
import 'package:tieup/features/job_details/presentaition/widgets/job_benefits_section.dart';
import 'package:tieup/features/job_details/presentaition/widgets/job_description_section.dart';
import 'package:tieup/features/job_details/presentaition/widgets/skills_section.dart';

class JobDetails extends StatelessWidget {
  JobDetails({Key? key}) : super(key: key);

  List <Map<String,dynamic>> generalInformation = [
    {'iconPath':CustomIcons.location,'title':'location','description' :'Aleepo '},
    {'iconPath':CustomIcons.share,'title':'Job type ','description' :'on-site'},
    {'iconPath':CustomIcons.job,'title':'Experience','description' :'1 - 2 years'},
    {'iconPath':CustomIcons.dollar,'title':'Salary ','description' :'100 - 250 \$'},
    {'iconPath':CustomIcons.clock,'title':'job style','description' :'full time'},
    {'iconPath':CustomIcons.profile,'title':'Vacancies ','description' :'12'},
    {'iconPath':CustomIcons.share,'title':'Age ','description' :'25 - 35 years'},
    {'iconPath':CustomIcons.share,'title':'Gender ','description' :'male'},
    {'iconPath':CustomIcons.share,'title':'Military service ','description' :'finished'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
        appBar: AppBar(
          title: Text(
            'Job Description',
            style: CustomFontStyle.titleStyle.copyWith(fontSize: 18),
          ),
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                CustomIcons.save,
                width: 24.w,
                height: 24.w,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                CustomIcons.share,
                width: 24.w,
                height: 24.w,
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              GeneralSection(generalInformation: generalInformation),
              SizedBox(
                height: 8.h,
              ),
              SkillsSection(),
              SizedBox(
                height: 8.h,
              ),
              JobDescriptionSection(title: 'Job Description'),
              SizedBox(
                height: 8.h,
              ),
              JobDescriptionSection(title: 'Job Requirements'),
              SizedBox(
                height: 8.h,
              ),
              JobBenefitsSection(),
              SizedBox(
                height: 8.h,
              ),
              AboutCompanySection(),
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
