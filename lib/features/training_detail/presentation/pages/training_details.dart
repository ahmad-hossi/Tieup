import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/core/constants/custom_icon.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/application/presentation/manager/apply_bloc.dart';
import 'package:tieup/features/favorite/presentation/manager/favorite_bloc.dart';
import 'package:tieup/features/job_detail/presentation/widgets/about_company_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/general_section.dart';
import 'package:tieup/features/job_detail/presentation/widgets/job_description_section.dart';
import 'package:tieup/features/training_detail/presentation/bloc/training_detail_bloc.dart';

class TrainingDetailScreen extends StatelessWidget {
  TrainingDetailScreen({Key? key}) : super(key: key);

  static const String routeName = '/jobDetail';

  List<Map<String, dynamic>> generalInformation = [
    {
      'iconPath': CustomIcons.location,
      'title': 'city',
      'description': 'Aleepo '
    },
    {'iconPath': CustomIcons.dollar, 'title': 'Cost', 'description': '50 \$'},
    {
      'iconPath': CustomIcons.share,
      'title': 'start date',
      'description': '2022/9/9'
    },
    {
      'iconPath': CustomIcons.share,
      'title': 'end date',
      'description': '2022/10/9'
    },
    {
      'iconPath': CustomIcons.share,
      'title': 'registration date',
      'description': '2022/9/10'
    },
    {
      'iconPath': CustomIcons.profile,
      'title': 'Vacancies ',
      'description': '12'
    },
  ];

  bool isFav = false;
  int? trainingId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Training Description',
            style: CustomFontStyle.titleStyle.copyWith(fontSize: 18),
          ),
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {
                if (trainingId != null) {
                  context
                      .read<FavoriteBloc>()
                      .add(AddToFavoriteEvent(id: trainingId!, type: 'Training '));
                }
              },
              icon: BlocConsumer<FavoriteBloc, FavoriteState>(
                listener: (context, state) {
                  if (state is FavoriteAddedFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('updated Failed')));
                  } else if (state is FavoriteAddedSuccessfully) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('updated Successfully')));
                  }
                },
                builder: (context, state) {
                  if (state is FavoriteAddedSuccessfully) {
                    return SvgPicture.asset(
                      CustomIcons.save,
                      width: 24.w,
                      height: 24.w,
                      color: state.status ? Colors.red : Colors.black,
                    );
                  } else {
                    return SvgPicture.asset(
                      CustomIcons.save,
                      width: 24.w,
                      height: 24.w,
                      color: isFav ? Colors.red : Colors.black,
                    );
                  }
                },
              ),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: SvgPicture.asset(
            //     CustomIcons.share,
            //     width: 24.w,
            //     height: 24.w,
            //   ),
            // ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<TrainingDetailBloc, TrainingDetailState>(
            listener: (context, state) {
              if (state is TrainingDetailLoaded) {
                isFav = state.trainingDetail.isFavorite;
                trainingId = state.trainingDetail.id;
              }
            },
            builder: (context, trainingState) {
              if(trainingState is TrainingDetailLoading){
                return CircularProgressIndicator();
              }else if (trainingState is TrainingDetailFailed){
                return Text(trainingState.errorMessage);
              }else
              if(trainingState is TrainingDetailLoaded) {
                return Column(
                children: [
                  GeneralSection(generalInformation: generalInformation),
                  SizedBox(
                    height: 8.h,
                  ),
                  //SkillsSection(),
                  SizedBox(
                    height: 8.h,
                  ),
                  JobDescriptionSection(
                      title: 'Training Description', textList: ['ddd', 'ddd']),
                  SizedBox(
                    height: 8.h,
                  ),
                  JobDescriptionSection(
                      title: 'Training Requirements', textList: ['ddd', 'ddd']),
                  SizedBox(
                    height: 8.h,
                  ),
                  AboutCompanySection(
                    companyDesc: 'desc',
                    companyName: 'MTN',
                    companyImageUrl:
                        'https://halberdbastion.com/sites/default/files/styles'
                        '/medium/public/2017-07/MTN-Syria-logo.jpg?itok=PKA8tk93',
                  ),
                  //geographySection(),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: BlocConsumer<ApplyBloc, ApplyState>(
                        listener: (context, state) {
                          if (state is ApplyAddedFailed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('applied Failed')));
                          } else if (state is ApplyAddedSuccessfully) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(state.status
                                        ? 'applied Successfully'
                                        : 'canceled Successfully')));
                          }
                        },
                        builder: (context, state) {
                          if (state is ApplyAddedSuccessfully) {
                            return DefaultButton(
                                text: state.status
                                    ? 'Cancel Apply'
                                    : 'Apply Now',
                                press: () {
                                  context.read<ApplyBloc>().add(ApplyAddEvent(
                                      id: trainingState.trainingDetail.id,
                                      type: 'Training '));
                                });
                          } else {
                            return DefaultButton(
                                text: trainingState.trainingDetail.isApplied
                                    ? 'Cancel Apply'
                                    : 'Apply Now',
                                press: () {
                                  context.read<ApplyBloc>().add(ApplyAddEvent(
                                      id: trainingState.trainingDetail.id,
                                      type: 'Training'));
                                });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              );
              }return Container();
            },
          ),
        ),
      ),
    );
  }
}
