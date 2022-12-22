import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/training_detail/domain/entities/training_detail.dart';

abstract class TrainingDetailRepository{
  Future<Either<Failure,TrainingDetail>> getTrainingDetail(int jobId);
}