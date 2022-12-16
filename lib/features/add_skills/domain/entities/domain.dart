import 'package:equatable/equatable.dart';

class Domain extends Equatable {
  final int id;
  final String name;
  const Domain({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Domain &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ name.hashCode;
}
