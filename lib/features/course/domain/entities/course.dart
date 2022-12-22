import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final int id;
  final String name;
  final String from;
  final String imgUrl;
  final String subDomain;
  final String dateOfAchievement;

  const Course({required this.id,
    required this.name,
    required this.from,
    required this.imgUrl,
    required this.subDomain,
    required this.dateOfAchievement});

  @override
  List<Object> get props => [id];
}
