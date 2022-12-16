
import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/signUp_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/authentication/domain/repositories/authentication_repositry.dart';
import '../../../../core/use_cases/use_case.dart';

class SignUpUser extends UseCase<bool,SignUpParams>{
  final AuthenticationRepository _authenticationRepository;
  SignUpUser(this._authenticationRepository);

  @override
  Future<Either<Failure, bool>> call(SignUpParams params) async =>
      _authenticationRepository.signUpUser(params.toJson());
}