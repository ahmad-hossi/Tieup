// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) {
  return ExperienceModel(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    jobTitle: json['jop_title'] as String,
    companyName: json['company'] as String,
    description: json['description'] as String,
    subDomainId: json['sub_domain_id'] as int,
    subDomainName: json['subDomain'] as String,
    startDate: json['start_date'] as String,
    endDate: json['end_date'] as String?,
  );
}

Map<String, dynamic> _$ExperienceModelToJson(ExperienceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'jop_title': instance.jobTitle,
      'company': instance.companyName,
      'description': instance.description,
      'sub_domain_id': instance.subDomainId,
      'subDomain': instance.subDomainName,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
