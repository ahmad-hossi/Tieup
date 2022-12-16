import 'package:equatable/equatable.dart';

class Language extends Equatable {
  int id;
  int languageId;
  String languageName;
  double level;

  Language({required this.id,
    required this.languageId,
    required this.languageName,
    required this.level});

  @override
  List<Object> get props => [id,languageId,languageName,level];
}
