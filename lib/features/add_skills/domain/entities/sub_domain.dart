import 'package:equatable/equatable.dart';

class SubDomain extends Equatable {
  final int id;
  final String name;

  const SubDomain({required this.id, required this.name});

  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is SubDomain &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ name.hashCode;
}
