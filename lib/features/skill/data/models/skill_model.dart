import 'package:tieup/features/skill/domain/entities/skill.dart';

class SkillModel extends Skill {
  final int id;
  final String name;
  final int? level;

  const SkillModel({required this.name, required this.id, this.level})
      : super(id: id, name: name,level: level);

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
      name: json['name'], id: json['skill_id'], level: json['level']);

  Map<String, dynamic> toJson() => {
        'skill_id': id,
        'level': level,
      };
}
