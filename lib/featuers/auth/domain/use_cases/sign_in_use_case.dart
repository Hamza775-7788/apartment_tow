import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';

import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthSignInUseCase {
  final AuthRepository repository;
  AuthSignInUseCase(this.repository);

  Future<Either<Failure, Unit>> call(
      {required String email, required String password}) async {
    return await repository.signIn(email: email, passowrd: password);
  }
}
