part of 'course_bloc.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<Course> courses;
  CourseLoaded({required this.courses});
}

class CourseFailed extends CourseState {
  final String errorMessage;
  CourseFailed({required this.errorMessage});
}

class CourseAddedSuccessfully extends CourseState {}