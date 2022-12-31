// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDetailModel _$JobDetailModelFromJson(Map<String, dynamic> json) {
  return JobDetailModel(
    id: json['id'] as int,
    jobTitle: json['job_title'] as String,
    jobType: json['job_type'] as String,
    jobStyle: json['job_style'] as String,
    minYearsRequirement: json['min_years_requirement'] as int,
    maxYearsRequirement: json['max_years_requirement'] as int,
    lowSalary: (json['low_salary'] as num).toDouble(),
    highSalary: (json['high_salary'] as num).toDouble(),
    minAge: json['min_age'] as int,
    maxAge: json['max_age'] as int,
    description: json['description'] as String,
    requirement: json['requirment'] as String,
    benefits: json['benefits'] as String,
    gender: json['gender'] as String,
    militaryService: json['military_service'] as String?,
    vacanciesNum: json['vacancies_num'] as int,
    cityName: json['city'] as String,
    subDomainId: json['sub_domain_id'] as int,
    subDomainName: json['subDomain'] as String,
    companyId: json['company_id'] as int,
    companyDescription: json['company_discription'] as String,
    companyName: json['company_name'] as String,
    companyProfileImage: json['company_profile_image'] as String,
    isFavorite: json['is_favorite'] as bool,
    isApply: json['is_application'] as bool,
    skills: (json['skills'] as List<dynamic>)
        .map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$JobDetailModelToJson(JobDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job_title': instance.jobTitle,
      'job_type': instance.jobType,
      'job_style': instance.jobStyle,
      'min_years_requirement': instance.minYearsRequirement,
      'max_years_requirement': instance.maxYearsRequirement,
      'low_salary': instance.lowSalary,
      'high_salary': instance.highSalary,
      'min_age': instance.minAge,
      'max_age': instance.maxAge,
      'description': instance.description,
      'requirment': instance.requirement,
      'benefits': instance.benefits,
      'gender': instance.gender,
      'military_service': instance.militaryService,
      'vacancies_num': instance.vacanciesNum,
      'city': instance.cityName,
      'sub_domain_id': instance.subDomainId,
      'subDomain': instance.subDomainName,
      'company_id': instance.companyId,
      'company_name': instance.companyName,
      'company_discription': instance.companyDescription,
      'company_profile_image': instance.companyProfileImage,
      'is_favorite': instance.isFavorite,
      'is_application': instance.isApply,
      'skills': instance.skills,
    };
