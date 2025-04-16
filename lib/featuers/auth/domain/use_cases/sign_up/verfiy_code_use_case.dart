import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthSignUpSendVerfiyCodeUsecase {
  final AuthRepository repository;
  AuthSignUpSendVerfiyCodeUsecase(this.repository);

  Future<Either<Failure, Unit>> call(
      {required String code, required String email}) async {
    return await repository.verifyCode(code: code, email: email);
  }
}
