import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    required this.svgIcon,
    required this.title,
    required this.routeName,
    this.titleColor = Colors.black,
    Key? key,
  }) : super(key: key);

  final String svgIcon;
  final String title;
  final String routeName;
  final Color titleColor;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 16.w),
        child: Row(
          children:  [
            SvgPicture.asset(svgIcon,width: 24,),
            SizedBox(width: 12.w,),
            Text(title,
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: titleColor),),
            const Spacer(),
            SvgPicture.asset('assets/icons/right-arrow.svg',width: 16,),
          ],
        ),
      ),
    );
  }
}