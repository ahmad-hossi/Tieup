import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/skill/domain/entities/sub_domain.dart';
import 'package:tieup/features/skill/domain/repositories/skill_repository.dart';

class GetSubDomains extends UseCase<List<SubDomain>, Params> {
  SkillRepository repository;
  GetSubDomains(this.repository);

  @override
  Future<Either<Failure, List<SubDomain>>> call(Params params) async {
    return await repository.getSubDomains(params.id);
  }
}
