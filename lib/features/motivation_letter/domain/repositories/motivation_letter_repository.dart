import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';

abstract class MotivationLetterRepository{
  Future<Either<Failure,String>> getMotivationLetter();
  Future<Either<Failure,String>> updateMotivationLetter(String text);
}
