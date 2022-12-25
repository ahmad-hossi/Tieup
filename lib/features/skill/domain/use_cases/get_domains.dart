import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/skill/domain/entities/domain.dart';
import 'package:tieup/features/skill/domain/repositories/skill_repository.dart';

class GetDomains extends UseCase<List<Domain>, NoParams> {
  SkillRepository repository;
  GetDomains(this.repository);

  @override
  Future<Either<Failure, List<Domain>>> call(NoParams params) async {
    return await repository.getDomains();
  }
}
