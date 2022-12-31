import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';

abstract class ApplyRepository {
  Future<Either<Failure, bool>> apply(int id, String type);
}
