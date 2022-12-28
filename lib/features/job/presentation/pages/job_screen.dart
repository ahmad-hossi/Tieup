import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/core/constants/enums.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/core/widgets/custom_nav_bar.dart';
import 'package:tieup/core/widgets/jobs_loading.dart';
import 'package:tieup/features/job/presentation/bloc/job_bloc.dart';
import 'package:tieup/features/job/presentation/widgets/job_card.dart';




class JobScreen extends StatefulWidget {
  const JobScreen({Key? key}) : super(key: key);

  static const String routeName = '/allJob';

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  void initState() {
    context.read<JobBloc>().add(GetALlJobsEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Jobs',
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
            onPressed: () {},
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
      body: BlocConsumer<JobBloc, JobState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is JobLoading) {
            return const JobsLoading();
          } else if (state is JobFailed) {
            return Text(state.errorMessage);
          } else if (state is JobLoaded) {
            return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
      ),
    );
  }
}


