import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final int id;
  final int languageId;
  final String languageName;
  final int level;

  const Language({required this.id,
    required this.languageId,
    required this.languageName,
    required this.level});

  @override
  List<Object> get props => [id,languageId,languageName,level];
}
