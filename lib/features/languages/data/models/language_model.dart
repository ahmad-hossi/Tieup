// ignore_for_file: annotate_overrides

import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/languages/domain/entities/language.dart';

part 'language_model.g.dart';

@JsonSerializable()
class LanguageModel extends Language {
  final int id;
  @JsonKey(name:'language_id')
  final int languageId;
  @JsonKey(name:'language')
  final String languageName;
  final int level;

  LanguageModel(
      {required this.id,
      required this.languageId,
      required this.languageName,
      required this.level})
      : super(
            id: id,
            languageId: languageId,
            languageName: languageName,
            level: level);

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);
}
