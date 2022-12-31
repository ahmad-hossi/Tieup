import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/training/domain/entities/training.dart';

abstract class TrainingRepository{
  Future<Either<Failure,List<Training>>> getTrainings();
  Future<Either<Failure,List<Training>>> getCompanyTrainings(int companyId);
  Future<Either<Failure,List<Training>>> getFavTrainings();
  Future<Either<Failure,List<Training>>> getAppliedTrainings();
}
