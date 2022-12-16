import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/languages/domain/entities/language.dart';

abstract class LanguagesRepository{
  Future<Either<Failure,List<Language>>> getLanguages();
  Future<Either<Failure,List<Language>>> updateLanguages(Map<String,dynamic> body);
}