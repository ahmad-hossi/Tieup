import 'package:tieup/features/skill/domain/entities/sub_domain.dart';

class SubDomainModel extends SubDomain {
  final int id;
  final String name;

  const SubDomainModel({required this.id, required this.name})
      : super(id: id, name: name);

  factory SubDomainModel.fromJSon(Map<String, dynamic> json) =>
      SubDomainModel(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
