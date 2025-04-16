import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthForgetPasswordSendCode {
  final AuthRepository repository;

  AuthForgetPasswordSendCode(this.repository);

  Future<Either<Failure, Unit>> call({required String email}) async {
    return await repository.forgetPasswordSendCode(email: email);
  }

  
}
