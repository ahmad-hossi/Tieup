import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tieup/core/error/failures.dart';
import 'package:tieup/features/profile/domain/entities/profile.dart';

abstract class ProfileRepository{
  Future<Either<Failure,Profile>> getUserProfile();
  Future<Either<Failure, bool>> updateCompanyImage(File imageFile, String type,int userId);
}