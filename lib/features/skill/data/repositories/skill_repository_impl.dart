import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/skill/data/data_sources/skill_remote_data_source.dart';
import 'package:tieup/features/skill/domain/entities/domain.dart';
import 'package:tieup/features/skill/domain/entities/skill.dart';
import 'package:tieup/features/skill/domain/entities/sub_domain.dart';
import 'package:tieup/features/skill/domain/repositories/skill_repository.dart';

class SkillRepositoryImpl implements SkillRepository{
  SkillRemoteDataSource remoteDataSource;
  SkillRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Domain>>> getDomains() async{
    try{
      return  Right(await remoteDataSource.getDomains());
    }on UnauthenticatedException{
      return const Left(Failure(errorType: ErrorType.unauthenticated));
    }on ServerException {
      return const Left(Failure(errorType: ErrorType.serverError));
    }
  }




  @override
  Future<Either<Failure, List<Skill>>> getSkills(int id) {
    // TODO: implement getSkills
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<SubDomain>>> getSubDomains(int id) async{
    try{
      return  Right(await remoteDataSource.getSubDomains(id));
    }on UnauthenticatedException{
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    }on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }


}