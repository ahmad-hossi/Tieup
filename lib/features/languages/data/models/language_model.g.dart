// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) {
  return LanguageModel(
    id: json['id'] as int,
    languageId: json['language_id'] as int,
    languageName: json['language'] as String,
    level: (json['level'] as num).toInt(),
  );
}

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'language_id': instance.languageId,
      'language': instance.languageName,
      'level': instance.level,
    };
