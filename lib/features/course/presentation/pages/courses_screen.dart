import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/course/presentation/bloc/course_bloc.dart';
import 'package:tieup/features/course/presentation/pages/add_course_screen.dart';
import 'package:tieup/features/course/presentation/widgets/course_card.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile/courses';

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  void initState() {
    context.read<CourseBloc>().add(GetCoursesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses and Certificates'),
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
                  'Adding all your Courses will increase your chances '
                  'to get the best job',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.1,
                  style: TextStyle(height: 1.5, color: kPrimaryColor),
                ),
                SizedBox(
                  height: 12.h,
                ),
                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    if (state is CourseLoading) {
                      return CircularProgressIndicator();
                    } else if (state is CourseFailed) {
                      return Text(state.errorMessage);
                    } else if (state is CourseLoaded) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (_, index) => CourseCard(
                            course: state.courses[index],
                          ),
                          itemCount: state.courses.length,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
            child: DefaultButton(
                text: 'Add Course Certificate',
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddCourseScreen()));
                }),
          )
        ],
      ),
    );
  }
}
