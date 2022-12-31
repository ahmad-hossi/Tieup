// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationModel _$EducationModelFromJson(Map<String, dynamic> json) {
  return EducationModel(
    id: json['id'] as int,
    educationTypeId: json['education_type_id'] as int,
    fieldOfStudy: json['field_of_study'] as String,
    from: json['from'] as String,
    startDate: json['start_date'] as String,
    endDate: json['end_date'] as String?,
    grade: (json['grade'] as num?)?.toDouble(),
    imageUrl: json['image'] as String?,
    educationType: json['education_type_name'] as String,
  );
}

Map<String, dynamic> _$EducationModelToJson(EducationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'education_type_id': instance.educationTypeId,
      'field_of_study': instance.fieldOfStudy,
      'from': instance.from,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'grade': instance.grade,
      'image': instance.imageUrl,
      'education_type_name': instance.educationType,
    };
