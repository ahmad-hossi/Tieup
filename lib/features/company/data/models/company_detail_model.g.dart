// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDetailModel _$CompanyDetailModelFromJson(Map<String, dynamic> json) {
  return CompanyDetailModel(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    description: json['description'] as String,
    profileImage: json['profile_image'] as String?,
    coverImage: json['cover_image'] as String?,
    phone: json['phone'] as String,
    location: json['location'] as String,
    longitude: (json['longitude'] as num).toDouble(),
    latitude: (json['latitude'] as num).toDouble(),
    cityId: json['city_id'] as int,
    city: json['city'] as String,
  );
}

Map<String, dynamic> _$CompanyDetailModelToJson(CompanyDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'description': instance.description,
      'profile_image': instance.profileImage,
      'cover_image': instance.coverImage,
      'phone': instance.phone,
      'location': instance.location,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'city_id': instance.cityId,
      'city': instance.city,
    };
