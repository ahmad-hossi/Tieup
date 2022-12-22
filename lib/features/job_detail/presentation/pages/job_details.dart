import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/core/constants/custom_icon.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/core/widgets/company_brief.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/job_detail/presentation/bloc/job_detail_bloc.dart';
import 'package:tieup/features/job_detail/presentation/widgets/about_company_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/job_benefits_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/job_description_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/skills_section.dart';
import 'package:tieup/core/widgets/icon_title.dart';
import 'package:intl/intl.dart';


class JobDetailScreen extends StatelessWidget {
  JobDetailScreen({Key? key}) : super(key: key);

  final formatCurrency = NumberFormat.simpleCurrency(name: '',decimalDigits: 0);
  
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
          child: BlocConsumer<JobDetailBloc, JobDetailState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is JobDetailLoading) {
                return CircularProgressIndicator();
              } else if (state is JobDetailFailed) {
                return Text(state.errorMessage);
              } else if (state is JobDetailLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.w),
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CompanyBrief(
                            companyName: state.jobDetail.companyName,
                            subDomainName: state.jobDetail.subDomainName,
                            imageUrl: state.jobDetail.companyProfileImage,
                            jobTitle: state.jobDetail.jobTitle,
                          ),
                          IconTitle(
                            iconPath: CustomIcons.location,
                            title: 'City ',
                            description: state.jobDetail.cityName,
                          ),
                          IconTitle(
                            iconPath: CustomIcons.share,
                            title: 'Job Type ',
                            description: state.jobDetail.jobType,
                          ),
                          IconTitle(
                            iconPath: CustomIcons.share,
                            title: 'Job Style ',
                            description: state.jobDetail.jobStyle,
                          ),
                          IconTitle(
                            iconPath: 'assets/icons/experience.svg',
                            title: 'Experience ',
                            description: '${state.jobDetail.minYearsRequirement.toString()} - '
                                '${state.jobDetail.maxYearsRequirement.toString()} Years'
                          ),
                          IconTitle(
                              iconPath: CustomIcons.dollar,
                              title: 'Salary ',
                              description: '${formatCurrency.format(state.jobDetail.lowSalary)} '
                                  '- ${formatCurrency.format(state.jobDetail.highSalary)} SP'),
                          IconTitle(
                              iconPath: 'assets/icons/location.svg',
                              title: 'Vacancies ',
                              description: state.jobDetail.vacanciesNum.toString()
                          ),
                          IconTitle(
                              iconPath: CustomIcons.job,
                              title: 'Age ',
                              description: '${state.jobDetail.minAge.toString()} - '
                                  '${state.jobDetail.maxAge.toString()} Years'
                          ),
                          IconTitle(
                              iconPath: 'assets/icons/location.svg',
                              title: 'Gender ',
                              description: state.jobDetail.gender.toString()
                          ),
                          if(state.jobDetail.militaryService != null)
                          IconTitle(
                              iconPath: 'assets/icons/military.svg',
                              title: 'Military service  ',
                              description: state.jobDetail.militaryService.toString()
                          ),
                        ],
                      ),
                    ),
                    //GeneralSection(generalInformation: generalInformation),
                    SizedBox(
                      height: 8.h,
                    ),
                    SkillsSection(
                      skills: state.jobDetail.skills
                        ..sort(
                            (a, b) => a.name.length.compareTo(b.name.length)),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    JobDescriptionSection(title: 'Job Description',
                        textList: state.jobDetail.description.split('*')),
                    SizedBox(
                      height: 8.h,
                    ),
                    JobDescriptionSection(title: 'Job Requirements',
                      textList: state.jobDetail.requirement.split('*'),),
                    SizedBox(
                      height: 8.h,
                    ),
                    JobBenefitsSection(),
                    SizedBox(
                      height: 8.h,
                    ),
                    AboutCompanySection(
                      companyName: state.jobDetail.companyName,
                      companyDesc: state.jobDetail.companyDescription,
                      companyImageUrl: state.jobDetail.companyProfileImage,
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        child: DefaultButton(text: 'Apply Now', press: () {}),
                      ),
                    ),
                  ],
                );
              }
              return Container(
                color: Colors.red,
              );
            },
          ),
        ),
      ),
    );
  }
}
