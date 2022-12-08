part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState{
  @override
  List<Object?> get props => [];
}

class AuthenticationSuccess extends AuthenticationState{


  @override
  List<Object?> get props => [];

}

class AuthenticationFailed extends AuthenticationState{
  final String errorMessage;

  const AuthenticationFailed({required this.errorMessage});

  @override
  List<Object?> get props => [];
}
