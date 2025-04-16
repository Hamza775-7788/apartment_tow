import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';

import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthSetProfileUsecase {
  final AuthRepository repository;
  AuthSetProfileUsecase(this.repository);
  Future<Either<Failure, Unit>> call({required File image}) async {
    return await repository.setProfile(image: image);
  }
}
