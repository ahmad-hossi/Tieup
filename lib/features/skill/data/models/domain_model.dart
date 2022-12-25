// ignore_for_file: annotate_overrides

import 'package:tieup/features/skill/domain/entities/domain.dart';

class DomainModel extends Domain {
  final int id;
  final String name;
  const DomainModel({required this.id, required this.name})
      : super(id: id, name: name);

  factory DomainModel.fromJSon(Map<String, dynamic> json) =>
      DomainModel(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
