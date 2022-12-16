import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tieup/core/entities/login_params.dart';

import 'package:tieup/core/entities/signUp_params.dart';
import 'package:tieup/features/authentication/domain/use_cases/signUp_user.dart';
import 'package:tieup/features/loading/presentation/bloc/loading_cubit.dart';
import '../../domain/use_cases/login_user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  LoginUser loginUser;
  SignUpUser signUpUser;
  LoadingCubit loadingCubit;

  AuthenticationBloc({required this.loginUser,required this.signUpUser,
    required this.loadingCubit})
      : super(AuthenticationInitial()) {
    on<LoginEvent>(_onLogin);
    on<SignUpEvent>(_onSignUp);
  }

  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    loadingCubit.show();
    emit(AuthenticationLoading());
    final eitherResponse = await loginUser(LoginParams(event.email, event.password));
    print(eitherResponse);
    emit(eitherResponse.fold((failure) => const AuthenticationFailed(errorMessage: 'error'),
            (success) => AuthenticationSuccess()));
    loadingCubit.hide();
  }
  Future<void> _onSignUp(
      SignUpEvent event,
      Emitter<AuthenticationState> emit,
      ) async {
    loadingCubit.show();
    emit(AuthenticationLoading());
    final eitherResponse = await signUpUser(SignUpParams(email: event.email,
       password: event.password,fullName: event.fullName , phoneNumber: event.phone
      ));
    print(eitherResponse);
    emit(eitherResponse.fold((failure) => const AuthenticationFailed(errorMessage: 'error'),
            (success) => AuthenticationSuccess()));
    loadingCubit.hide();
  }
}
