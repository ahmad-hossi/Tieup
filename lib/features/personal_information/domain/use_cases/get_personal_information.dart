import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/personal_information/domain/entities/personal_information.dart';
import 'package:tieup/features/personal_information/domain/repositories/personal_information_repository.dart';

class GetPersonalInformation implements UseCase<PersonalInformation, NoParams> {
  final PersonalInformationRepository repository;
  GetPersonalInformation(this.repository);

  @override
  Future<Either<Failure, PersonalInformation>> call(NoParams params) async{
    return await repository.getPersonalInformation();
  }
}
