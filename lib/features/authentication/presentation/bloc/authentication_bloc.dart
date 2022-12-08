import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tieup/core/entities/login_params.dart';
import 'package:tieup/features/loading/presentation/bloc/loading_cubit.dart';
import '../../domain/use_cases/login_user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  LoginUser loginUser;
  LoadingCubit loadingCubit;

  AuthenticationBloc({required this.loginUser, required this.loadingCubit})
      : super(AuthenticationInitial()) {
    on<LoginEvent>(_onLogin);
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
}
