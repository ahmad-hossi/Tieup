import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/core/constants/custom_icon.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/core/widgets/company_brief.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/core/widgets/icon_title.dart';
import 'package:tieup/features/application/presentation/manager/apply_bloc.dart';
import 'package:tieup/features/favorite/presentation/manager/favorite_bloc.dart';
import 'package:tieup/features/job_detail/presentation/widgets/about_company_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/general_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/job_description_section.dart';
import 'package:tieup/features/training_detail/presentation/bloc/training_detail_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tieup/features/job_detail/presentation/widgets/skills_section.dart';
import 'package:map_launcher/map_launcher.dart';


class TrainingDetailScreen extends StatelessWidget {
  TrainingDetailScreen({Key? key}) : super(key: key);

  static const String routeName = '/jobDetail';

  final formatCurrency =
  NumberFormat.simpleCurrency(name: '', decimalDigits: 0);

  bool isFav = false;
  int? trainingId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Training Detail',
            style: CustomFontStyle.titleStyle.copyWith(fontSize: 18),
          ),
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {
                if (trainingId != null) {
                  context.read<FavoriteBloc>().add(
                      AddToFavoriteEvent(id: trainingId!, type: 'Training '));
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
          child: BlocConsumer<TrainingDetailBloc, TrainingDetailState>(
            listener: (context, state) {
              if (state is TrainingDetailLoading) {
              } else if (state is TrainingDetailFailed) {
              } else if (state is TrainingDetailLoaded) {
                isFav = state.trainingDetail.isFavorite;
                trainingId = state.trainingDetail.id;
              }
            },
            builder: (context, trainingState) {
              if (trainingState is TrainingDetailLoading) {
                return const SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: Center(child: CircularProgressIndicator()));
              } else if (trainingState is TrainingDetailFailed) {
                return Text(trainingState.errorMessage);
              } else if (trainingState is TrainingDetailLoaded) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.w),
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CompanyBrief(
                            companyName: trainingState.trainingDetail.companyName,
                            subDomainName:
                            trainingState.trainingDetail.subDomainName,
                            imageUrl:
                            trainingState.trainingDetail.companyProfileImage,
                            jobTitle: trainingState.trainingDetail.name,
                          ),
                          IconTitle(
                            iconPath: CustomIcons.location,
                            title: 'City ',
                            description: trainingState.trainingDetail.cityName,
                          ),
                          IconTitle(
                              iconPath: CustomIcons.share,
                              title: 'Cost ',
                              description: '${formatCurrency.format(trainingState.trainingDetail.cost)} SP'
                          ),
                          IconTitle(
                            iconPath: CustomIcons.share,
                            title: 'start date ',
                            description: trainingState.trainingDetail.startDate,
                          ),
                          IconTitle(
                            iconPath: CustomIcons.share,
                            title: 'end date ',
                            description: trainingState.trainingDetail.endDate,
                          ),
                          IconTitle(
                            iconPath: CustomIcons.share,
                            title: 'registration date ',
                            description: trainingState.trainingDetail.registrationDate,
                          ),
                          IconTitle(
                              iconPath: 'assets/icons/location.svg',
                              title: 'Vacancies ',
                              description: trainingState.trainingDetail.vacanciesNum
                                  .toString()),
                      ],),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SkillsSection(
                      skills: trainingState.trainingDetail.skills
                        ..sort(
                                (a, b) => a.name.length.compareTo(b.name.length)),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    JobDescriptionSection(
                        title: 'Training Description',
                        textList: trainingState.trainingDetail.description.split('*')),
                    SizedBox(
                      height: 8.h,
                    ),
                    JobDescriptionSection(
                        title: 'Training Requirements',
                        textList: trainingState.trainingDetail.requirement.split('*')),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(12.w),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tap on map to get Directions',
                            style: CustomFontStyle.titleStyle,
                          ),
                          SizedBox(height: 8,),
                          GestureDetector(
                              onTap: () async {
                                final availableMaps =
                                await MapLauncher.installedMaps;
                                await availableMaps.first.showMarker(
                                  coords: Coords(
                                      trainingState
                                          .trainingDetail.latitude,
                                      trainingState
                                          .trainingDetail.longitude),
                                  title:
                                  trainingState.trainingDetail.name,
                                );
                              },
                              child:
                              Image.asset('assets/images/map.jpg')),
                        ],
                      ),
                    ),
                    AboutCompanySection(
                      companyId: trainingState.trainingDetail.companyId,
                      companyDesc: trainingState.trainingDetail.companyDescription,
                      companyName: trainingState.trainingDetail.companyName,
                      companyImageUrl: trainingState.trainingDetail.companyProfileImage,
                    ),
                    SizedBox(
                      height: 8.h,
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
                                        id: trainingState.trainingDetail.id,
                                        type: 'Training '));
                                  });
                            } else {
                              return DefaultButton(
                                  text: trainingState.trainingDetail.isApplied
                                      ? 'Cancel Apply'
                                      : 'Apply Now',
                                  press: () {
                                    context.read<ApplyBloc>().add(ApplyAddEvent(
                                        id: trainingState.trainingDetail.id,
                                        type: 'Training'));
                                  });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
