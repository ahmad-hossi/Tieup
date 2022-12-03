import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/common/widgets/custom_nav_bar.dart';
import 'package:tieup/common/widgets/no_account_text.dart';
import 'package:tieup/constant/custom_icon.dart';
import 'package:tieup/constant/enums.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/Home/presentation/widgets/job_card.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Recommended Jobs',
                    ),
                    NoAccountText(
                      text2: 'View all',
                    )
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    height: 168,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => const JobCard(),
                        separatorBuilder: (_, index) => SizedBox(
                              width: 8.w,
                            ),
                        itemCount: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'New Openings',
                    ),
                    NoAccountText(
                      text2: 'View all',
                    )
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    height: 168,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => const JobCard(),
                        separatorBuilder: (_, index) => SizedBox(
                              width: 8.w,
                            ),
                        itemCount: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Top Companies',
                    ),
                    NoAccountText(
                      text2: 'View all',
                    )
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    height: 168,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (_, index) => Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/images/google_logo.png',
                              width: 44.w,
                            ),
                            Text('Google')
                          ],
                        ),
                      ),
                      itemCount: 8,
                    )),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomNavBar(menuState: MenuState.home,)
      ),
    );
  }
}
