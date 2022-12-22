// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInformationModel _$PersonalInformationModelFromJson(
    Map<String, dynamic> json) {
  return PersonalInformationModel(
    id: json['id'] as int,
    fullName: json['full_name'] as String,
    phone: json['phone'] as String,
    birthday: json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String),
    gender: json['gender'] as String?,
    address: json['address'] as String?,
    openToWork: json['open_to_work'] as int,
    militaryService: json['military_service'] as String?,
    summary: json['summary'] as String?,
    cityId: json['city_id'] as int?,
    cityName: json['city_name'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$PersonalInformationModelToJson(
        PersonalInformationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'gender': instance.gender,
      'phone': instance.phone,
      'birthday': instance.birthday?.toIso8601String(),
      'open_to_work': instance.openToWork,
      'military_service': instance.militaryService,
      'address': instance.address,
      'summary': instance.summary,
      'city_id': instance.cityId,
      'city_name': instance.cityName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
