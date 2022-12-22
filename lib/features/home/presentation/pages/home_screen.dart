import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/widgets/custom_nav_bar.dart';
import 'package:tieup/core/widgets/no_account_text.dart';
import 'package:tieup/core/constants/enums.dart';
import 'package:tieup/features/job/presentation/widgets/job_card.dart';
import 'package:badges/badges.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/menu-left.svg',
                  color: Color(0xff364965),
                  width: 34.w,
                  height: 34.h,
                )),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/search.svg',
                    color: Color(0xff364965),
                    width: 34.w,
                    height: 34.h,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Badge(
                    badgeContent: Text('3',style: TextStyle(color: Colors.white,fontSize: 12),),
                    padding: EdgeInsets.all(4),
                    position: BadgePosition(bottom: 16,start: 14),
                    child: SvgPicture.asset(
                      'assets/icons/notification.svg',
                      color: Color(0xff364965),
                      width: 34.w,
                      height: 34.h,
                    ),
                  )),
            ],
            centerTitle: true,
            title: Image.asset('assets/images/logo_text.png',
              width: 120.w,
              color: kPrimaryColor,)
            // const Text('TIEUP',style: TextStyle(
            //     color: kPrimaryColor,
            //     fontSize: 32,
            //     letterSpacing: 6,
            //     fontWeight: FontWeight.w500),)
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w,0,16.w,8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recommended Jobs',style: TextStyle(
                          color: Color(0xff283C5A),
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),
                        ),
                        NoAccountText(
                          text2: 'View all',
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 186.h,
                    child: PageView.builder(
                      controller: PageController(
                        viewportFraction: 0.95,
                        initialPage: 0,
                      ),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (_,index)=>Placeholder(
                          color: kPrimaryColor
                        )
                            //JobCard(),
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w,0,16.w,8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recommended Trainings',style :TextStyle(
                            color: Color(0xff283C5A),
                            fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                        NoAccountText(
                          text2: 'View all',
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 186.h,
                      child: PageView.builder(
                          controller: PageController(
                            viewportFraction: 0.95,
                            initialPage: 0,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) => Placeholder(
                            color: kPrimaryColor,
                          ),//JobCard(),
                          itemCount: 10)),
                  SizedBox(height: 8.h,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w,0,16.w,8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: const Text(
                            'Top Companies',style :TextStyle(
                              color: Color(0xff283C5A),
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                          ),
                        ),
                        NoAccountText(
                          text2: 'View all',
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(16.w,0,16.w,8.h),
                      width: double.infinity,
                      height: 168,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
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
          bottomNavigationBar: CustomNavBar(
            menuState: MenuState.home,
          )),
    );
  }
}
