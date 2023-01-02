import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/core/constants/enums.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/core/widgets/custom_nav_bar.dart';
import 'package:tieup/features/job/presentation/bloc/job_bloc.dart';
import 'package:tieup/features/job/presentation/widgets/job_card.dart';
import 'package:shimmer/shimmer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static const String routeName = '/FavJobs';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    context.read<JobBloc>().add(GetFavJobsEvent());
    super.initState();
  }

  bool filterScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favourite Jobs',
            style: CustomFontStyle.titleStyle.copyWith(fontSize: 18),
          ),
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 24.w,
                height: 24.w,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  filterScreen = !filterScreen;
                });
              },
              icon: SvgPicture.asset(
                'assets/icons/filter.svg',
                width: 24.w,
                height: 24.w,
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBar: CustomNavBar(
          menuState: MenuState.settings,
        ),
        body: filterScreen
            ? BlocConsumer<JobBloc, JobState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is JobLoading) {
                    return ListView.separated(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
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
                  } else if (state is JobFailed) {
                    return Text(state.errorMessage);
                  } else if (state is JobLoaded) {
                    return ListView.separated(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        itemBuilder: (_, index) => JobCard(
                              jobInformation: state.jobs[index],
                            ),
                        separatorBuilder: (_, index) => SizedBox(
                              height: 8.h,
                            ),
                        itemCount: state.jobs.length);
                  }
                  return Container();
                },
              )
            : Container(

        ));
  }
}
