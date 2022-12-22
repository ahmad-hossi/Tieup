import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/features/course/domain/entities/course.dart';
import 'package:tieup/features/course/domain/use_cases/get_courses.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  GetCourses getCourses;

  CourseBloc({required this.getCourses}) : super(CourseInitial()) {
    on<GetCoursesEvent>((event, emit) async {
      emit(CourseLoading());
      final eitherResponse = await getCourses(NoParams());
      emit(eitherResponse.fold((failure) => CourseFailed(errorMessage: 'errorMessage'),
              (courses) => CourseLoaded(courses: courses)));
    });
  }
}
