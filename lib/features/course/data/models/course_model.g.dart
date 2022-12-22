// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) {
  return CourseModel(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    name: json['name'] as String,
    from: json['from'] as String,
    imgUrl: json['image'] as String,
    subDomain: json['subDomain'] as String,
    dateOfAchievement: json['date_of_achievement'] as String,
  );
}

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'from': instance.from,
      'image': instance.imgUrl,
      'subDomain': instance.subDomain,
      'date_of_achievement': instance.dateOfAchievement,
    };
