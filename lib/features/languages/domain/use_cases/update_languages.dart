import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/languages_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/languages/domain/entities/language.dart';
import 'package:tieup/features/languages/domain/repositories/langauges_repository.dart';

class UpdateLanguages implements UseCase<List<Language>, LanguagesParams> {
  LanguagesRepository repository;

  UpdateLanguages(this.repository);

  @override
  Future<Either<Failure, List<Language>>> call(LanguagesParams params) {
   return repository.updateLanguages(params.toJson());
  }
}
