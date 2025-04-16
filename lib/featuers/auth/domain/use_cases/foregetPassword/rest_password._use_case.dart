import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';

import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthForgetPasswordRestPasswordUsecase {
  final AuthRepository repository;
  AuthForgetPasswordRestPasswordUsecase(this.repository);

  Future<Either<Failure, Unit>> call(
      {required String email, required String newPassword}) async {
    return await repository.foregetPasswordRestPassword(
        email: email, newPassword: newPassword);
  }
}
