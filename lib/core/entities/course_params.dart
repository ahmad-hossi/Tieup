import 'dart:io';

class CourseParams {
  File imageFile;
  String name;
  String from;
  String dateOfAchievement;
  int subDomainId;

  CourseParams(
      {required this.imageFile,
      required this.name,
      required this.from,
      required this.dateOfAchievement,
      required this.subDomainId});

  @override
  String toString() {
    return 'CourseParams{imageFile: $imageFile, name: $name, from: $from, dateOfAchievement: $dateOfAchievement, subDomainId: $subDomainId}';
  }
}
