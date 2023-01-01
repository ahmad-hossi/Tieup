import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/education/presentation/bloc/education_bloc.dart';
import 'package:tieup/features/education/presentation/pages/add_education_screen.dart';
import 'package:tieup/features/education/presentation/widgets/education_card.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile/Education';

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  void initState() {
    context.read<EducationBloc>().add(GetUserEducationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Education Certificates'),
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.black54,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                BlocBuilder<EducationBloc, EducationState>(
                  builder: (context, state) {
                    if (state is EducationLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is EducationFailed) {
                      return Text(state.errorMessage);
                    } else if (state is EducationLoaded) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (_, index) => EducationCard(
                            education: state.userEducation[index],
                          ),
                          itemCount: state.userEducation.length,
                        ),
                      );
                    } else
                      return Container(
                        color: Colors.red,
                      );
                  },
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
            child: DefaultButton(
                text: 'Add Certificate',
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const AddEducationScreen()));
                }),
          )
        ],
      ),
    );
  }
}
