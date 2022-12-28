import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/education/domain/entities/education.dart';

part 'education_model.g.dart';

@JsonSerializable()
class EducationModel extends Education {
  final int id;
  @JsonKey(name: 'education_type_id')
  final int educationTypeId;
  @JsonKey(name: 'field_of_study')
  final String fieldOfStudy;
  final String from;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;
  final double? grade;
  @JsonKey(name: 'image')
  final String? imageUrl;
  @JsonKey(name: 'education_type_name')
  final String educationType;

  EducationModel(
      {required this.id,
      required this.educationTypeId,
      required this.fieldOfStudy,
        required this.from,
      required this.startDate,
      this.endDate,
      this.grade,
      this.imageUrl,
      required this.educationType})
      : super(
            id: id,
            startDate: startDate,
            educationType: educationType,
            educationTypeId: educationTypeId,
            fieldOfStudy: fieldOfStudy,
            from: from,
            grade: grade,
            imageUrl: imageUrl,
            endDate: endDate);

  factory EducationModel.fromJson(Map<String, dynamic> json) =>
      _$EducationModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationModelToJson(this);
}
