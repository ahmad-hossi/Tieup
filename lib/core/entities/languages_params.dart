class LanguagesParams {
  String languageId;
  String level;

  LanguagesParams({required this.languageId, required this.level});

  Map<String, dynamic> toJson() => {'language_id': languageId, 'level': level};
}
