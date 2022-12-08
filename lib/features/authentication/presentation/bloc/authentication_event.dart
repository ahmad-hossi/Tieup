part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent{
  final String email;
  final String password;

  const LoginEvent({required this.email,required this.password});

  @override
  List<Object?> get props => [email,password];
}
