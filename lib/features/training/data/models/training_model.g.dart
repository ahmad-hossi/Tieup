// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingModel _$TrainingModelFromJson(Map<String, dynamic> json) {
  return TrainingModel(
    id: json['id'] as int,
    name: json['name'] as String,
    cost: (json['cost'] as num).toDouble(),
    cityName: json['city'] as String,
    subDomainName: json['subDomain'] as String,
    companyId: json['company_id'] as int,
    companyName: json['company_name'] as String,
    companyImgUrl: json['company_profile_image'] as String,
    startDate: json['start_date'] as String,
    postedDate: json['posted'] as String,
  );
}

Map<String, dynamic> _$TrainingModelToJson(TrainingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cost': instance.cost,
      'city': instance.cityName,
      'subDomain': instance.subDomainName,
      'company_id': instance.companyId,
      'company_name': instance.companyName,
      'company_profile_image': instance.companyImgUrl,
      'start_date': instance.startDate,
      'posted': instance.postedDate,
    };
