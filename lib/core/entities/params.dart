import 'package:equatable/equatable.dart';

class Params extends Equatable{
  final int id;
  const Params({required this.id});

  @override
  List<Object?> get props => [id];
}