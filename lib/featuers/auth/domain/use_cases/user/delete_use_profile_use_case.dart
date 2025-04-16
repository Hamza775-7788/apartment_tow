import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthDeleteUsePrfileUsecase {
  final AuthRepository repository;
  AuthDeleteUsePrfileUsecase(this.repository);
  Future<Either<Failure, Unit>> call() async {
    return await repository.deleteProfile();
  }
}
