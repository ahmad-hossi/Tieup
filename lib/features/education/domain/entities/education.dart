class Education {
  final int id;
  final int educationTypeId;
  final String fieldOfStudy;
  final String from;
  final String startDate;
  final String? endDate;
  final double? grade;
  final String? imageUrl;
  final String educationType;
  Education(
      {required this.id,
      required this.educationTypeId,
      required this.fieldOfStudy,
      required this.startDate,
      required this.from,
      this.endDate,
      this.grade,
      this.imageUrl,
      required this.educationType});
}
