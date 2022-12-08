import 'package:tieup/core/entities/login_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/authentication/domain/repositories/authentication_repositry.dart';


class LoginUser extends UseCase<bool,LoginParams>{
  final AuthenticationRepository _authenticationRepository;
  LoginUser(this._authenticationRepository);

  @override
  Future<Either<Failure, bool>> call(LoginParams params) async =>
      _authenticationRepository.loginUser(params.email,params.password);
  }



