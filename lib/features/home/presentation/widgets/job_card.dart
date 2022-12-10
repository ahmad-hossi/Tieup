import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/widgets/company_brief.dart';
import 'package:tieup/core/widgets/icon_title.dart';
import 'package:tieup/core/constants/custom_icon.dart';
import 'package:tieup/features/job_details/presentaition/job_details.dart';


class JobCard extends StatelessWidget {
  const JobCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>JobDetails()));
      },
      child: Container(
        padding: EdgeInsets.all(8.w),
        width: 320.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4.r)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CompanyBrief(),
                //Spacer(flex: 1,),
                Icon(Icons.save)
              ],
            ),
            //SizedBox(height: 8.h,),
            IconTitle(iconPath: CustomIcons.profile, title: 'location',description: 'Aleppo'),
            Row(
              children: [
                Icon(Icons.account_balance_outlined),
                Text('1-2 years')
              ],
            ),
            Row(
              children: [
                Icon(Icons.attach_money_outlined),
                Text('300,000 - 600,000')
              ],
            ),
            Text('Posted on 12/8/2022')
          ],
        ),
      ),
    );
  }
}
