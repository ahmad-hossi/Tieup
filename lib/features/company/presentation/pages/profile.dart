import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tieup/features/company/presentation/bloc/company_bloc.dart';
import 'package:tieup/features/job/presentation/bloc/job_bloc.dart';
import 'package:tieup/features/job/presentation/widgets/job_card.dart';
import 'package:tieup/features/profile/presentation/widgets/profile_pic.dart';
import 'package:tieup/features/training/presentation/bloc/training_bloc.dart';
import 'package:tieup/features/training/presentation/widgets/training_card.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:map_launcher/map_launcher.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({required this.companyName, Key? key}) : super(key: key);
  final String companyName;
  static const routeName = '/companyProfile';

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.companyName),
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.black54,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<CompanyBloc, CompanyState>(
          listener: (context, state) {
            if (state is CompanyLoaded) {
              context
                  .read<JobBloc>()
                  .add(GetCompanyJobsEvent(companyId: state.companyDetail.id));
            }
          },
          builder: (context, companyState) {
            if (companyState is CompanyLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (companyState is CompanyFailed) {
              return Text(companyState.errorMessage);
            } else if (companyState is CompanyLoaded) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 128.h,
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/place_holder.png',
                                image:
                                    '$kBaseUrl/${companyState.companyDetail.profileImage!}',
                                height: 128.h,
                                width: double.infinity,
                                fit: BoxFit.fitHeight,
                                imageErrorBuilder: (_, object, __) =>
                                    Image.asset(
                                        'assets/images/place_holder.png'),
                              ),
                            ),
                            Container(
                              //color: Colors.red,
                              padding: EdgeInsets.fromLTRB(80.w, 0, 0, 8.h),
                              height: 48.h,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  companyState.companyDetail.name,
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
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/Mail.svg',
                                        width: 20,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(companyState.companyDetail.email),
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
                                      Text(companyState.companyDetail.phone),
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
                                      Text(
                                          '${companyState.companyDetail.location} , ${companyState.companyDetail.city}'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        final availableMaps =
                                            await MapLauncher.installedMaps;
                                        await availableMaps.first.showMarker(
                                          coords: Coords(
                                              companyState
                                                  .companyDetail.latitude,
                                              companyState
                                                  .companyDetail.longitude),
                                          title:
                                              companyState.companyDetail.name,
                                        );
                                      },
                                      child:
                                          Image.asset('assets/images/map.jpg')),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    companyState.companyDetail.description,
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
                        child: ProfilePic(
                            imageUrl: companyState.companyDetail.profileImage!),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                      //height: 40.h,
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'All Jobs From Microsoft',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                  BlocConsumer<JobBloc, JobState>(
                    listener: (context, state) {
                      if (state is JobLoaded) {
                        context.read<TrainingBloc>().add(
                            GetCompanyTrainingsEvent(
                                companyId: companyState.companyDetail.id));
                      }
                    },
                    builder: (context, state) {
                      if (state is JobLoading) {
                        return Shimmer.fromColors(
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
                        );
                      } else if (state is JobFailed) {
                        return Text(state.errorMessage);
                      } else if (state is JobLoaded) {
                        return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
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
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                      //height: 40.h,
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'All Trainings From Microsoft',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                  BlocConsumer<TrainingBloc, TrainingState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is TrainingLoading) {
                        return Shimmer.fromColors(
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
                        );
                      } else if (state is TrainingFailed) {
                        return Text(state.errorMessage);
                      } else if (state is TrainingLoaded) {
                        return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            itemBuilder: (_, index) => TrainingCard(
                                  trainingInformation: state.trainings[index],
                                ),
                            separatorBuilder: (_, index) => SizedBox(
                                  height: 8.h,
                                ),
                            itemCount: state.trainings.length);
                      }
                      return Container();
                    },
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
