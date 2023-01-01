import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/entities/image_params.dart';
import 'package:tieup/features/course/presentation/pages/courses_screen.dart';
import 'package:tieup/features/cv/presentation/pages/resume_screen.dart';
import 'package:tieup/features/education/presentation/pages/eduaction_screen.dart';
import 'package:tieup/features/experience/presentation/pages/experience_screen.dart';
import 'package:tieup/features/job/presentation/pages/applied_jobs_screen.dart';
import 'package:tieup/features/job/presentation/pages/fav_jobs_screen.dart';
import 'package:tieup/features/languages/presentation/pages/languages_screen.dart';
import 'package:tieup/features/motivation_letter/presentation/pages/Motivation_letter_screen.dart';
import 'package:tieup/features/personal_information/presentation/pages/personal_information_screen.dart';
import 'package:tieup/features/portfolio/presentation/pages/portfolio_screen.dart';
import 'package:tieup/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:tieup/features/profile/presentation/widgets/profile_card.dart';
import 'package:tieup/features/profile/presentation/widgets/profile_pic.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tieup/features/skill/presentation/pages/skill_screen.dart';
import 'package:tieup/features/training/presentation/pages/applied_trainings_screen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetUserProfileEvent());
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();

  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xDFF5F5F5),
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.black54,
          ),
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ImageUpdatedFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('something went error')));
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const SizedBox(
                width: double.infinity,
                height: 500,
                child: Center(child: CircularProgressIndicator()));
          } else if (state is ProfileFailed) {
            return Text(state.errorMessage);
          } else if (state is ProfileLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                _picker
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) {
                                  if (value != null) {
                                    context.read<ProfileBloc>().add(
                                        UpdateUserImageEvent(
                                            params: ImageParams(
                                                id: state.userProfile.id,
                                                imageFile: File(value.path),
                                                imageType: 'userCover')));
                                  }
                                });
                              },
                              child: SizedBox(
                                height: 128.h,
                                child: state.userProfile.coverImageUrl == null
                                    ? Image.asset(
                                        'assets/images/place_holder.png',
                                        height: 128.h,
                                        width: double.infinity,
                                        fit: BoxFit.fitWidth,
                                      )
                                    : FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/images/place_holder.png',
                                        image:
                                            '$kBaseUrl/${state.userProfile.coverImageUrl}',
                                        height: 128.h,
                                        width: double.infinity,
                                        fit: BoxFit.fitHeight,
                                        imageErrorBuilder: (_, object, __) =>
                                            Image.asset(
                                                'assets/images/place_holder.png'),
                                      ),
                              ),
                            ),
                            Container(
                              //color: Colors.red,
                              padding: EdgeInsets.fromLTRB(10.w, 0, 0, 8.h),
                              height: 48.h,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  state.userProfile.fullName,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/Mail.svg',
                                        width: 20,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(state.userProfile.email),
                                      SizedBox(width: 8.w),
                                      Container(
                                          padding: EdgeInsets.all(3.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            color: Colors.green,
                                          ),
                                          child: Text(
                                            'verified',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/phone.svg',
                                        width: 20,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(state.userProfile.phone),
                                      SizedBox(width: 8.w),
                                      Text(
                                        'verify',
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  if (state.userProfile.address != null &&
                                      state.userProfile.cityName != null)
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/location.svg',
                                          width: 20,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                            '${state.userProfile.address} , ${state.userProfile.cityName}'),
                                      ],
                                    ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  if(state.userProfile.summary != null)
                                  Text(
                                    state.userProfile.summary!,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20.w,
                        top: 68.h,
                        child: GestureDetector(
                          onTap: () async {
                            _picker
                                .pickImage(source: ImageSource.gallery)
                                .then((value) {
                              if (value != null) {
                                context.read<ProfileBloc>().add(
                                    UpdateUserImageEvent(
                                        params: ImageParams(
                                            id: state.userProfile.id,
                                            imageFile: File(value.path),
                                            imageType: 'userProfile')));
                              }
                            });
                          },
                          child: ProfilePic(
                            imageUrl: state.userProfile.imageUrl,
                            isOpenToWork: state.userProfile.openToWork,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Profile Strength',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LinearPercentIndicator(
                              linearGradient: const LinearGradient(colors: [
                                Color(0xFF8BBDFA),
                                //Colors.lightBlueAccent,
                                // Colors.blue,
                                kPrimaryColor
                              ]),
                              width: 300.w,
                              lineHeight: 6.0,
                              percent: 0.8,
                              backgroundColor: Color(0xFFE0E5F8),
                              barRadius: Radius.circular(4.r),
                            ),
                            Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                '80%',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.w,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                      title: 'Personal Information',
                      svgIcon: 'assets/icons/personal-information.svg',
                      routeName: PersonalInformationScreen.routeName),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Portfolio',
                    svgIcon: 'assets/icons/personal-information.svg',
                    routeName: PortfolioScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Languages',
                    svgIcon: 'assets/icons/language.svg',
                    routeName: LanguagesScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Education',
                    svgIcon: 'assets/icons/personal-information.svg',
                    routeName: EducationScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Work Experience',
                    svgIcon: 'assets/icons/personal-information.svg',
                    routeName: ExperienceScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Skills',
                    svgIcon: 'assets/icons/personal-information.svg',
                    routeName: SkillScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Courses & Certificates',
                    svgIcon: 'assets/icons/personal-information.svg',
                    routeName: CoursesScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Cover Letter',
                    svgIcon: 'assets/icons/personal-information.svg',
                    routeName: MotivationLetterScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Favourite Jobs',
                    svgIcon: 'assets/icons/personal-information.svg',
                    routeName: FavJobsScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Favourite Trainings',
                    svgIcon: 'assets/icons/personal-information.svg',
                    routeName: FavJobsScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Applied Jobs',
                    svgIcon: 'assets/icons/personal-information.svg',
                    routeName: AppliedJobsScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Applied Trainings',
                    svgIcon: 'assets/icons/personal-information.svg',
                    routeName: AppliedTrainingsScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ProfileCard(
                    title: 'Generate CV',
                    titleColor: Colors.red,
                    svgIcon: 'assets/icons/personal-information.svg',
                    routeName: ResumeScreen.routeName,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
