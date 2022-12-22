import 'package:tieup/features/add_skills/domain/entities/skill.dart';

class SkillModel extends Skill{
  final int id;
  final String name;

  const SkillModel({required this.name, required this.id}) : super(id: id, name: name);

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      SkillModel(name: json['skill_name'], id: json['skill_id']);

  Map<String,dynamic> toJson()=>{
    'skill_name' : name,
    'skill_id' : id
  };
}
