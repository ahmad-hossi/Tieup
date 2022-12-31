import 'package:equatable/equatable.dart';

class FavParams extends Equatable {
  final int id;
  final String type;

  FavParams({required this.id, required this.type});

  @override
  List<Object?> get props => [];
}
