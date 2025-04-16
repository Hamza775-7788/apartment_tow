import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';
import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthUpdateUserUsecase {
  final AuthRepository repository;
  AuthUpdateUserUsecase(this.repository);

  Future<Either<Failure, Unit>> call({required User user, File? image}) async {
    return await repository.updateUser(user: user, image: image);
  }
}
