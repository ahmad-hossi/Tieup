import 'package:dartz/dartz.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/core/use_cases/use_case.dart';
import 'package:tieup/features/languages/domain/entities/language.dart';
import 'package:tieup/features/languages/domain/repositories/langauges_repository.dart';

class GetLanguages implements UseCase<List<Language>, NoParams> {
  LanguagesRepository repository;

  GetLanguages(this.repository);

  @override
  Future<Either<Failure, List<Language>>> call(NoParams params) {
    return repository.getLanguages();
  }
}
