import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/core/constants/custom_icon.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/job_detail/presentation/widgets/about_company_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/general_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/job_description_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/skills_section.dart';
import 'package:tieup/features/training_detail/domain/entities/training_detail.dart';
import 'package:tieup/features/training_detail/presentation/bloc/training_detail_bloc.dart';

class TrainingDetailScreen extends StatelessWidget {
  TrainingDetailScreen({Key? key}) : super(key: key);

  static const String routeName = '/jobDetail';

  List<Map<String, dynamic>> generalInformation = [
    {
      'iconPath': CustomIcons.location,
      'title': 'city',
      'description': 'Aleepo '
    },
    {'iconPath': CustomIcons.dollar, 'title': 'Cost', 'description': '50 \$'},
    {
      'iconPath': CustomIcons.share,
      'title': 'start date',
      'description': '2022/9/9'
    },
    {
      'iconPath': CustomIcons.share,
      'title': 'end date',
      'description': '2022/10/9'
    },
    {
      'iconPath': CustomIcons.share,
      'title': 'registration date',
      'description': '2022/9/10'
    },
    {
      'iconPath': CustomIcons.profile,
      'title': 'Vacancies ',
      'description': '12'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Training Description',
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
          child: BlocConsumer<TrainingDetailBloc, TrainingDetailState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                children: [
                  GeneralSection(generalInformation: generalInformation),
                  SizedBox(
                    height: 8.h,
                  ),
                  //SkillsSection(),
                  SizedBox(
                    height: 8.h,
                  ),
                  JobDescriptionSection(
                      title: 'Training Description', textList: ['ddd', 'ddd']),
                  SizedBox(
                    height: 8.h,
                  ),
                  JobDescriptionSection(
                      title: 'Training Requirements', textList: ['ddd', 'ddd']),
                  SizedBox(
                    height: 8.h,
                  ),
                  AboutCompanySection(
                    companyDesc: 'desc',
                    companyName: 'MTN',
                    companyImageUrl:
                        'https://halberdbastion.com/sites/default/files/styles'
                        '/medium/public/2017-07/MTN-Syria-logo.jpg?itok=PKA8tk93',
                  ),
                  //geographySection(),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: DefaultButton(text: 'Apply', press: () {}),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
