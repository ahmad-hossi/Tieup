import 'dart:io';

class EducationParams {
  File? imageFile;
  String fieldOfStudy;
  String from;
  String startDate;
  String? endDate;
  int educationTypeId;
  String grade;

  EducationParams(
      {this.imageFile,
      required this.fieldOfStudy,
      required this.from,
      required this.startDate,
      this.endDate,
      required this.educationTypeId,
      required this.grade});

  @override
  String toString() {
    return 'EducationParams{imageFile: $imageFile, fieldOfStudy: $fieldOfStudy, from: $from, startDate: $startDate, endDate: $endDate, educationTypeId: $educationTypeId, grade: $grade}';
  }
}
