// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) {
  return JobModel(
    id: json['id'] as int,
    jobTitle: json['job_title'] as String,
    minYearsRequirement: json['min_years_requirement'] as int,
    maxYearsRequirement: json['max_years_requirement'] as int,
    lowSalary: (json['low_salary'] as num).toDouble(),
    highSalary: (json['high_salary'] as num).toDouble(),
    cityName: json['city'] as String,
    subDomain: json['subDomain'] as String,
    companyId: json['company_id'] as int,
    companyName: json['company_name'] as String,
    companyImgUrl: json['company_profile_image'] as String,
    postedDate: json['posted'] as String?,
    status: json['status'] as String?,
    applicationDate: json['application_date'] as String?,
  );
}

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'id': instance.id,
      'job_title': instance.jobTitle,
      'min_years_requirement': instance.minYearsRequirement,
      'max_years_requirement': instance.maxYearsRequirement,
      'low_salary': instance.lowSalary,
      'high_salary': instance.highSalary,
      'city': instance.cityName,
      'subDomain': instance.subDomain,
      'company_id': instance.companyId,
      'company_name': instance.companyName,
      'company_profile_image': instance.companyImgUrl,
      'posted': instance.postedDate,
      'application_date': instance.applicationDate,
      'status': instance.status,
    };
