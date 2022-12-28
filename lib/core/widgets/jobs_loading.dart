import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class JobsLoading extends StatelessWidget {
  const JobsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        itemBuilder: (_, index) => Shimmer.fromColors(
          baseColor: Colors.grey,
          period: Duration(milliseconds: 2000),
          highlightColor: Colors.white,
          child: Container(
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            width: 320.w,
            height: 150.h,
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4.r)),
          ),
        ),
        separatorBuilder: (_, index) => SizedBox(
          height: 8.h,
        ),
        itemCount: 5);
  }
}