// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingDetailModel _$TrainingDetailModelFromJson(Map<String, dynamic> json) {
  return TrainingDetailModel(
    id: json['id'] as int,
    name: json['name'] as String,
    startDate: json['start_date'] as String,
    endDate: json['end_date'] as String,
    registrationDate: json['registration_date'] as String,
    cost: (json['cost'] as num).toDouble(),
    address: json['location'] as String,
    longitude: (json['longitude'] as num).toDouble(),
    latitude: (json['latitude'] as num).toDouble(),
    description: json['description'] as String,
    requirement: json['requirment'] as String,
    vacanciesNum: json['vacancies_num'] as int,
    cityName: json['city'] as String,
    subDomainId: json['sub_domain_id'] as int,
    subDomainName: json['subDomain'] as String,
    companyId: json['company_id'] as int,
    companyName: json['company_name'] as String,
    companyDescription: json['company_discription'] as String,
    companyProfileImage: json['company_profile_image'] as String,
    isApplied: json['is_application'] as bool,
    isFavorite: json['is_favorite'] as bool,
    skills: (json['skills'] as List<dynamic>)
        .map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TrainingDetailModelToJson(
        TrainingDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'registration_date': instance.registrationDate,
      'cost': instance.cost,
      'location': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'description': instance.description,
      'requirment': instance.requirement,
      'vacancies_num': instance.vacanciesNum,
      'city': instance.cityName,
      'sub_domain_id': instance.subDomainId,
      'subDomain': instance.subDomainName,
      'company_id': instance.companyId,
      'company_name': instance.companyName,
      'company_discription': instance.companyDescription,
      'company_profile_image': instance.companyProfileImage,
      'is_favorite': instance.isFavorite,
      'is_application': instance.isApplied,
      'skills': instance.skills,
    };
