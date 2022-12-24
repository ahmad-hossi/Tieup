import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/company/domain/entities/company.dart';

abstract class CompanyRepository{
   Future<Either<Failure,List<Company>>> getAllCompanies();
}