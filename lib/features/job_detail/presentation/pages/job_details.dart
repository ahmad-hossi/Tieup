import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/core/constants/custom_icon.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/core/widgets/company_brief.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/application/presentation/manager/apply_bloc.dart';
import 'package:tieup/features/favorite/presentation/manager/favorite_bloc.dart';
import 'package:tieup/features/job_detail/presentation/bloc/job_detail_bloc.dart';
import 'package:tieup/features/job_detail/presentation/widgets/about_company_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/job_benefits_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/job_description_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/skills_section.dart';
import 'package:tieup/core/widgets/icon_title.dart';
import 'package:intl/intl.dart';

class JobDetailScreen extends StatefulWidget {
  JobDetailScreen({Key? key}) : super(key: key);

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  final formatCurrency =
      NumberFormat.simpleCurrency(name: '', decimalDigits: 0);

  bool isFav = false;
  int? jobId;

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
              onPressed: () {
                if (jobId != null) {
                  context
                      .read<FavoriteBloc>()
                      .add(AddToFavoriteEvent(id: jobId!, type: 'job'));
                }
              },
              icon: BlocConsumer<FavoriteBloc, FavoriteState>(
                listener: (context, state) {
                  if (state is FavoriteAddedFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('updated Failed')));
                  } else if (state is FavoriteAddedSuccessfully) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('updated Successfully')));
                  }
                },
                builder: (context, state) {
                  if (state is FavoriteAddedSuccessfully) {
                    return SvgPicture.asset(
                      CustomIcons.save,
                      width: 24.w,
                      height: 24.w,
                      color: state.status ? Colors.red : Colors.black,
                    );
                  } else {
                    return SvgPicture.asset(
                      CustomIcons.save,
                      width: 24.w,
                      height: 24.w,
                      color: isFav ? Colors.red : Colors.black,
                    );
                  }
                },
              ),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: SvgPicture.asset(
            //     CustomIcons.share,
            //     width: 24.w,
            //     height: 24.w,
            //   ),
            // ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<JobDetailBloc, JobDetailState>(
            listener: (context, state) {
              if (state is JobDetailLoaded) {
                isFav = state.jobDetail.isFavorite;
                jobId = state.jobDetail.id;
              }
            },
            builder: (context, jobDetailState) {
              if (jobDetailState is JobDetailLoading) {
                return CircularProgressIndicator();
              } else if (jobDetailState is JobDetailFailed) {
                return Text(jobDetailState.errorMessage);
              } else if (jobDetailState is JobDetailLoaded) {
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
                            companyName: jobDetailState.jobDetail.companyName,
                            subDomainName:
                                jobDetailState.jobDetail.subDomainName,
                            imageUrl:
                                jobDetailState.jobDetail.companyProfileImage,
                            jobTitle: jobDetailState.jobDetail.jobTitle,
                          ),
                          IconTitle(
                            iconPath: CustomIcons.location,
                            title: 'City ',
                            description: jobDetailState.jobDetail.cityName,
                          ),
                          IconTitle(
                            iconPath: CustomIcons.share,
                            title: 'Job Type ',
                            description: jobDetailState.jobDetail.jobType,
                          ),
                          IconTitle(
                            iconPath: CustomIcons.share,
                            title: 'Job Style ',
                            description: jobDetailState.jobDetail.jobStyle,
                          ),
                          IconTitle(
                              iconPath: 'assets/icons/experience.svg',
                              title: 'Experience ',
                              description:
                                  '${jobDetailState.jobDetail.minYearsRequirement.toString()} - '
                                  '${jobDetailState.jobDetail.maxYearsRequirement.toString()} Years'),
                          IconTitle(
                              iconPath: CustomIcons.dollar,
                              title: 'Salary ',
                              description:
                                  '${formatCurrency.format(jobDetailState.jobDetail.lowSalary)} '
                                  '- ${formatCurrency.format(jobDetailState.jobDetail.highSalary)} SP'),
                          IconTitle(
                              iconPath: 'assets/icons/location.svg',
                              title: 'Vacancies ',
                              description: jobDetailState.jobDetail.vacanciesNum
                                  .toString()),
                          IconTitle(
                              iconPath: CustomIcons.job,
                              title: 'Age ',
                              description:
                                  '${jobDetailState.jobDetail.minAge.toString()} - '
                                  '${jobDetailState.jobDetail.maxAge.toString()} Years'),
                          IconTitle(
                              iconPath: 'assets/icons/location.svg',
                              title: 'Gender ',
                              description:
                                  jobDetailState.jobDetail.gender.toString()),
                          if (jobDetailState.jobDetail.militaryService != null)
                            IconTitle(
                                iconPath: 'assets/icons/military.svg',
                                title: 'Military service  ',
                                description: jobDetailState
                                    .jobDetail.militaryService
                                    .toString()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SkillsSection(
                      skills: jobDetailState.jobDetail.skills
                        ..sort(
                            (a, b) => a.name.length.compareTo(b.name.length)),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    JobDescriptionSection(
                        title: 'Job Description',
                        textList:
                            jobDetailState.jobDetail.description.split('*')),
                    SizedBox(
                      height: 8.h,
                    ),
                    JobDescriptionSection(
                      title: 'Job Requirements',
                      textList: jobDetailState.jobDetail.requirement.split('*'),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    JobDescriptionSection(
                      title: 'Benefits & Perks',
                      textList: jobDetailState.jobDetail.benefits.split('*'),
                    ),
                    //JobBenefitsSection(),
                    SizedBox(
                      height: 8.h,
                    ),
                    AboutCompanySection(
                      companyId: jobDetailState.jobDetail.companyId,
                      companyName: jobDetailState.jobDetail.companyName,
                      companyDesc: jobDetailState.jobDetail.companyDescription,
                      companyImageUrl:
                          jobDetailState.jobDetail.companyProfileImage,
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        child: BlocConsumer<ApplyBloc, ApplyState>(
                          listener: (context, state) {
                            if (state is ApplyAddedFailed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('applied Failed')));
                            } else if (state is ApplyAddedSuccessfully) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(state.status
                                          ? 'applied Successfully'
                                          : 'canceled Successfully')));
                            }
                          },
                          builder: (context, state) {
                            if (state is ApplyAddedSuccessfully) {
                              return DefaultButton(
                                  text: state.status
                                      ? 'Cancel Apply'
                                      : 'Apply Now',
                                  press: () {
                                    context.read<ApplyBloc>().add(ApplyAddEvent(
                                        id: jobDetailState.jobDetail.id,
                                        type: 'job'));
                                  });
                            } else {
                              return DefaultButton(
                                  text: jobDetailState.jobDetail.isApply
                                      ? 'Cancel Apply'
                                      : 'Apply Now',
                                  press: () {
                                    context.read<ApplyBloc>().add(ApplyAddEvent(
                                        id: jobDetailState.jobDetail.id,
                                        type: 'job'));
                                  });
                            }
                          },
                        ),
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
