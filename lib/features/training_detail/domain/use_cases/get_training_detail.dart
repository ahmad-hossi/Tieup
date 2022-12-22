import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/training_detail/domain/entities/training_detail.dart';
import 'package:tieup/features/training_detail/domain/repositories/training_detail_repository.dart';

class GetTrainingDetail extends UseCase<TrainingDetail,Params>{
  TrainingDetailRepository repository;
  GetTrainingDetail(this.repository);

  @override
  Future<Either<Failure, TrainingDetail>> call(Params params) async{
    return await repository.getTrainingDetail(params.id);
  }
}