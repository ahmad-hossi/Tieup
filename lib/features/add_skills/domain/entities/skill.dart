import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final int id;
  final String name;

  const Skill({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
