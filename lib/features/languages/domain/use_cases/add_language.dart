import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/languages_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/languages/domain/repositories/langauges_repository.dart';

class AddLanguage implements UseCase<bool, LanguagesParams> {
  LanguagesRepository repository;

  AddLanguage(this.repository);

  @override
  Future<Either<Failure, bool>> call(LanguagesParams params) {
   return repository.addLanguage(params.toJson());
  }
}
