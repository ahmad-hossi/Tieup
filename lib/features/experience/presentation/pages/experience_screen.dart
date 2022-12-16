import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/experience/presentation/bloc/work_experience_bloc.dart';
import 'package:tieup/features/experience/presentation/pages/add_work_experience_screen.dart';
import 'package:tieup/features/experience/presentation/widgets/experience_card.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile/workExperience';

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  @override
  void initState() {
    context.read<WorkExperienceBloc>().add(GetWorkExperienceEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/experience.svg',
                        width: 40.w,
                        height: 40.w,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      const Text('Work Experience',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const Text(
                  'Adding all your work experience will increase your chances '
                      'to get the best job',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.1,
                  style: TextStyle(height: 1.5, color: kPrimaryColor),
                ),
                SizedBox(
                  height: 12.h,
                ),
                BlocBuilder<WorkExperienceBloc, WorkExperienceState>(
                  builder: (context, state) {
                    if(state is WorkExperienceLoading){
                      return Center(child: CircularProgressIndicator());
                    }else if(state is WorkExperienceFailed){
                      return Text(state.errorMessage);
                    }else if (state is WorkExperienceLoaded){
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (_, index) =>  ExperienceCard(
                            workExperience: state.worksExperience[index],
                          ),
                          itemCount: state.worksExperience.length,
                        ),
                      );
                    }else return Container(color: Colors.red,);
                  },
                )
              ],
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
            child: DefaultButton(
                text: 'Add job experience',
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const AddWorkExperienceScreen()));
                }),
          )
        ],
      ),
    );
  }
}
