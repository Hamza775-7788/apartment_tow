import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';
import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthSignUpuseCase {
  final AuthRepository repository;
  AuthSignUpuseCase(this.repository);

  Future<Either<Failure, Unit>> call({required User user}) async {
    return await repository.signUp(user: user);
  }
}
