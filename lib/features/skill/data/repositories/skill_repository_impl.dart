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
  Future<Either<Failure, List<Skill>>> getSkills(int id) async{
    try{
      return  Right(await remoteDataSource.getSkills(id));
    }on UnauthenticatedException{
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    }on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
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

  @override
  Future<Either<Failure, List<Skill>>> getUserSkills() async{
    try{
      return  Right(await remoteDataSource.getUserSkills());
    }on UnauthenticatedException{
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    }on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, List<Skill>>> addUserSkills(List<Skill> skills)async {
    try{
      return  Right(await remoteDataSource.addUserSkills(skills));
    }on UnauthenticatedException{
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    }on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getSuggestedSkills() async{
    try{
      return  Right(await remoteDataSource.getSuggestedSkills());
    }on UnauthenticatedException{
    return const Left(Failure(errorType: ErrorType.unauthenticated));
    }on ServerException {
    return const Left(Failure(errorType: ErrorType.serverError));
    }
  }


}