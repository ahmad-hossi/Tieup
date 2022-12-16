part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignUpEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final String fullName;
  final String phone;

  const SignUpEvent(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.phone});

  @override
  List<Object?> get props => [email, password, fullName, phone];
}
