import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthSignUpSendCodeUsecase {
  final AuthRepository repository;
  AuthSignUpSendCodeUsecase(this.repository);
  Future<Either<Failure, Unit>> call(
      {required String email, required String passowrd}) async {
    return await repository.sendCode(email: email, passowrd: passowrd);
  }
}
