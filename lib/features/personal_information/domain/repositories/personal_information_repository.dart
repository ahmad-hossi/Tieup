import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/update_pesrsonal_information_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/personal_information/domain/entities/personal_information.dart';

abstract class PersonalInformationRepository {
  Future<Either<Failure, PersonalInformation>> getPersonalInformation();
  Future<Either<Failure, PersonalInformation>> updatePersonalInformation(
      PersonalInformationParams params);
}
