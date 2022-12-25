import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final int id;
  final String name;
  final int? level;

  const Skill({required this.id, required this.name,this.level});

  @override
  List<Object?> get props => [id, name];
}
