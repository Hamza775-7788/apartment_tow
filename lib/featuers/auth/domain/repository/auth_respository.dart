import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signIn(
      {required String email, required String passowrd});

  Future<Either<Failure, User>> getUser();
  //  this method for sign up
  Future<Either<Failure, Unit>> sendCode(
      {required String email, required String passowrd});
  Future<Either<Failure, Unit>> verifyCode(
      {required String code, required String email});
  Future<Either<Failure, Unit>> signUp({required User user});
  // forget password
  Future<Either<Failure, Unit>> forgetPasswordSendCode({required String email});
  Future<Either<Failure, Unit>> forgetPasswordverifyCode(
      {required String code, required String email});
  Future<Either<Failure, Unit>> foregetPasswordRestPassword(
      {required String email, required String newPassword});
  // Rest Password
  Future<Either<Failure, Unit>> restPassword(
      {required String oldPassword, required String newPasswored});
  // Update User
  Future<Either<Failure, Unit>> deleteProfile();
  Future<Either<Failure, Unit>> setProfile({required File image});
  Future<Either<Failure, Unit>> updateUser({required User user, File? image});
}
