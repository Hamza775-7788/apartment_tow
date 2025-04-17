import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:apartment_tow/core/error/exceptions.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/core/local_api/local_data_source.dart';
import 'package:apartment_tow/core/network/network.dart';
import 'package:apartment_tow/featuers/auth/data/data_source/remote_data_source.dart';
import 'package:apartment_tow/featuers/auth/data/model/user_model.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';
import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';

class AuthReositoryImpl extends AuthRepository {
  final LocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthReositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> deleteProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final userInfo = await localDataSource.getCachedUser();
        final response = await remoteDataSource.deleteUserProfie(
          id: userInfo.id,
        );
        await localDataSource.cachedUser(response);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> foregetPasswordRestPassword({
    required String email,
    required String newPassword,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.foregetPasswordRestPassword(
          email: email,
          newPassword: newPassword,
        );
        await localDataSource.cachedUser(response);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetPasswordSendCode({
    required String email,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.forgetPasswordsendCode(email: email);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetPasswordverifyCode({
    required String code,
    required String email,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.foregetPasswordVerifyCode(
          code: code,
          email: email,
        );

        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    if (await networkInfo.isConnected) {
      try {
        final userInfo = await localDataSource.getCachedUser();
        final response = await remoteDataSource.getUser(id: userInfo.id);
        await localDataSource.cachedUser(response);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      try {
        final response = await localDataSource.getCachedUser();
        return Right(response);
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> restPassword({
    required String oldPassword,
    required String newPasswored,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final userInfo = await localDataSource.getCachedUser();
        await remoteDataSource.restPassword(
          id: userInfo.id,
          oldPassword: oldPassword,
          newPasswored: newPasswored,
        );
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> sendCode({
    required String email,
    required String passowrd,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.sendCode(email: email, passowrd: passowrd);

        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> setProfile({required File image}) async {
    if (await networkInfo.isConnected) {
      try {
        final userInfo = await localDataSource.getCachedUser();
        final response = await remoteDataSource.setProfile(
          id: userInfo.id,
          image: image,
        );
        await localDataSource.cachedUser(response);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String passowrd,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.signIn(
          email: email,
          passowrd: passowrd,
        );
        await localDataSource.cachedUser(response);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp({required User user}) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userMode = UserModel(
          phone: user.phone,
          profile: user.profile,
          id: user.id,
          name: user.name,
          type: user.type,
          email: user.email,
        );
        final response = await remoteDataSource.signUp(userModel: userMode);
        await localDataSource.cachedUser(response);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUser({
    required User user,
    File? image,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final userInfo = await localDataSource.getCachedUser();
        UserModel userMode = UserModel(
          phone: user.phone,
          id: userInfo.id,
          profile: userInfo.profile,
          name: user.name,
          type: user.type,
          email: user.email,
        );
        final response = await remoteDataSource.updateUser(
          image: image,
          userModle: userMode,
        );
        await localDataSource.cachedUser(response);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyCode({
    required String code,
    required String email,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.verifyCode(code: code, email: email);

        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      } on PassowrdWrongExeption {
        return Left(PassowrdWrongFailuer());
      } on OperationNotCompletedException {
        return Left(OperationNotCompletedFailure());
      } on EmptyRemotDataException {
        return Left(EmptyRemotDataFailure());
      } on UnexpectedErrorException {
        return Left(UnexpectedErrorFailuer());
      } on DuplicateException {
        return Left(DuplicateFailuer());
      } on LinkedRecourdException {
        return Left(LinkedRecourdFailuer());
      } on EmailExistsExeption {
        return Left(EmailExistsFailuer());
      } on EmailWrongExeption {
        return Left(EmailWrongFailuer());
      } on CodeIsWrongExeption {
        return Left(CodeIsFailure());
      } on TimeDoneException {
        return Left(TimeDoneFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}

/*
  try {} on ServerException {
      return Left(ServerFailure());
    } on EmptyCashException {
      return Left(EmptyCashFailure());
    } on PassowrdWrongExeption {
      return Left(PassowrdWrongFailuer());
    } on OperationNotCompletedException {
      return Left(OperationNotCompletedFailure());
    } on EmptyRemotDataException {
      return Left(EmptyRemotDataFailure());
    } on UnexpectedErrorException {
      return Left(UnexpectedErrorFailuer());
    } on DuplicateException {
      return Left(DuplicateFailuer());
    } on LinkedRecourdException {
      return Left(LinkedRecourdFailuer());
    } on EmailExistsExeption {
      return Left(EmailExistsFailuer());
    } on EmailWrongExeption {
      return Left(EmailWrongFailuer());
    } on CodeIsWrongExeption {
      return Left(CodeIsFailure());
    } on TimeDoneException {
      return Left(TimeDoneFailure());
    }

*/
