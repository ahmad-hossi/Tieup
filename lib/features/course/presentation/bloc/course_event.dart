part of 'course_bloc.dart';

@immutable
abstract class CourseEvent {}

class GetCoursesEvent extends CourseEvent{}

class AddCourseEvent extends CourseEvent{
  final CourseParams params;
  AddCourseEvent({required this.params});
}
