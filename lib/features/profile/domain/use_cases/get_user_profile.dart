import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/profile/domain/entities/profile.dart';
import 'package:tieup/features/profile/domain/repositories/profile_repository.dart';

class GetUserProfile extends UseCase<Profile,NoParams>{
  ProfileRepository repository;
  GetUserProfile(this.repository);

  @override
  Future<Either<Failure, Profile>> call(NoParams params) {
    return repository.getUserProfile();
  }

}