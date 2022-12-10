import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final ErrorType errorType;
  const Failure({required this.errorType});

  @override
  List<Object?> get props => [errorType];

}

enum ErrorType {serverError , unauthorisedError, unauthenticated }