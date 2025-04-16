import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';
import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthGetUserInfoUsecase {
  final AuthRepository repository;
  AuthGetUserInfoUsecase(this.repository);

  Future<Either<Failure, User>> call() async {
    return await repository.getUser();
  }
}
