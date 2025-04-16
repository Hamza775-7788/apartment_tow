import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthRestPasswordUsecase {
  final AuthRepository repository;
  AuthRestPasswordUsecase(this.repository);
  Future<Either<Failure, Unit>> call(
      {required String oldPassword, required String newPasswored}) async {
    return await repository.restPassword(
        oldPassword: oldPassword, newPasswored: newPasswored);
  }
}
