import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';

abstract class AuthenticationRepository{
  Future<Either<Failure,bool>> loginUser(String email,String password);
}