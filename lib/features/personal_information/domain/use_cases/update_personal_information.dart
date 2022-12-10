import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/update_pesrsonal_information_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/personal_information/domain/entities/personal_information.dart';
import 'package:tieup/features/personal_information/domain/repositories/personal_information_repository.dart';

class UpdatePersonalInformation
    implements UseCase<PersonalInformation, PersonalInformationParams> {
  final PersonalInformationRepository repository;
  UpdatePersonalInformation(this.repository);

  @override
  Future<Either<Failure, PersonalInformation>> call(
      PersonalInformationParams params) async {
    return await repository.updatePersonalInformation(params);
  }
}
