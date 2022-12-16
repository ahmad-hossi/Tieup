import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/experience/presentation/pages/experience_screen.dart';
import 'package:tieup/features/personal_information/presentation/pages/personal_information_screen.dart';
import 'package:tieup/features/profile/presentation/widgets/profile_card.dart';
import 'package:tieup/features/profile/presentation/widgets/profile_pic.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/cover.jpg',
                        height: 128.h,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                      Container(
                        //color: Colors.red,
                        padding: EdgeInsets.fromLTRB(10.w,0,0,8.h),
                        height: 48.h,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Ahmad Hossi',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/Mail.svg',
                                  width: 20,
                                ),
                                SizedBox(width: 8.w),
                                const Text('Ahmad.hessi.96@gmail.com'),
                                SizedBox(width: 8.w),
                                Container(
                                    padding: EdgeInsets.all(3.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: Colors.green,
                                    ),
                                    child: Text(
                                      'verified',
                                      style: TextStyle(color: Colors.white),
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
                                const Text('0950011344'),
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
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/location.svg',
                                  width: 20,
                                ),
                                SizedBox(width: 8.w),
                                const Text('Aleppo , Syria'),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              'Experienced software engineer with a passion for building high-quality,'
                              ' reliable systems. Skilled in various programming languages and technologies.'
                              ' Committed to using agile methodologies and best practices.'
                              ' Strong collaborator and communicator.'
                              ' Always seeking new challenges and opportunities to learn and grow.',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 8.h,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20.w,
                  top: 68.h,
                  child: ProfilePic(),
                ),
                Positioned(
                  top: 142.h,
                  right: 8.w,
                  child: SvgPicture.asset(
                    'assets/icons/edit-2.svg',
                    width: 50.w,
                    height: 50.w,
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
                children:  [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Profile Strength',
                      style: TextStyle(fontWeight: FontWeight.w500),),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LinearPercentIndicator(
                        linearGradient: const LinearGradient(
                            colors: [
                              Color(0xFF8BBDFA),
                              //Colors.lightBlueAccent,
                             // Colors.blue,
                              kPrimaryColor
                            ]
                        ),
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
                        child: Text('80%',style: TextStyle(fontWeight: FontWeight.w500),),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.w,)
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            const ProfileCard(title: 'Personal Information',
                svgIcon: 'assets/icons/personal-information.svg',
                routeName: PersonalInformationScreen.routeName),
            SizedBox(
              height: 8.h,
            ),
            const ProfileCard(title: 'Portfolio',
                svgIcon: 'assets/icons/personal-information.svg',
              routeName: PersonalInformationScreen.routeName,
            ),
            SizedBox(
              height: 8.h,
            ),
            const ProfileCard(title: 'Languages',
                svgIcon: 'assets/icons/language.svg',
              routeName: PersonalInformationScreen.routeName,
            ),
            SizedBox(
              height: 8.h,
            ),
            const ProfileCard(title: 'Education',
                svgIcon: 'assets/icons/personal-information.svg',
              routeName: PersonalInformationScreen.routeName,
            ),
            SizedBox(
              height: 8.h,
            ),
            const ProfileCard(title: 'Work Experience',
                svgIcon: 'assets/icons/personal-information.svg',
              routeName: ExperienceScreen.routeName,
            ),
            SizedBox(
              height: 8.h,
            ),
            const ProfileCard(title: 'Skills',
                svgIcon: 'assets/icons/personal-information.svg',
              routeName: PersonalInformationScreen.routeName,
            ),
            SizedBox(
              height: 8.h,
            ),
            const ProfileCard(title: 'Cover Letter',
                svgIcon: 'assets/icons/personal-information.svg',
              routeName: PersonalInformationScreen.routeName,
            ),
            SizedBox(
              height: 8.h,
            ),

            // Card(
            //   child: ListTile(
            //     leading: SvgPicture.asset('assets/icons/profile.svg'),
            //     title: Text(
            //       'Personal information',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     trailing: SvgPicture.asset(
            //       'assets/icons/right-arrow.svg',
            //       width: 28,
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (_) => const PersonalInformationScreen()));
            //     },
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     leading: SvgPicture.asset(
            //       'assets/icons/portfolio.svg',
            //       width: 36,
            //     ),
            //     title: Text(
            //       'Portfolio',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     trailing: SvgPicture.asset(
            //       'assets/icons/right-arrow.svg',
            //       width: 28,
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (_) => const PortfolioScreen()));
            //     },
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     leading: SvgPicture.asset('assets/icons/profile.svg'),
            //     title: Text(
            //       'Education',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     trailing: SvgPicture.asset(
            //       'assets/icons/right-arrow.svg',
            //       width: 28,
            //     ),
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     leading: SvgPicture.asset('assets/icons/profile.svg'),
            //     title: const Text(
            //       'Experience',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     trailing: SvgPicture.asset(
            //       'assets/icons/right-arrow.svg',
            //       width: 28,
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (_) => const ExperienceScreen()));
            //     },
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     leading: SvgPicture.asset('assets/icons/profile.svg'),
            //     title: const Text(
            //       'Languages',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     trailing: SvgPicture.asset(
            //       'assets/icons/right-arrow.svg',
            //       width: 28,
            //     ),
            //     onTap: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (_) => LanguagesScreen()));
            //     },
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     leading: SvgPicture.asset('assets/icons/profile.svg'),
            //     title: const Text(
            //       'Skills',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     trailing: SvgPicture.asset(
            //       'assets/icons/right-arrow.svg',
            //       width: 28,
            //     ),
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     leading: SvgPicture.asset('assets/icons/profile.svg'),
            //     title: const Text(
            //       'Upload cv',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     trailing: SvgPicture.asset(
            //       'assets/icons/right-arrow.svg',
            //       width: 28,
            //     ),
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     leading: SvgPicture.asset('assets/icons/profile.svg'),
            //     title: const Text(
            //       'Motivation letter',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     trailing: SvgPicture.asset(
            //       'assets/icons/right-arrow.svg',
            //       width: 28,
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (_) => const MotivationLetterScreen()));
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


