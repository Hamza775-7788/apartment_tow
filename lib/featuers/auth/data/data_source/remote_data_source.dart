import 'dart:convert';
import 'dart:io';
import "package:path/path.dart" as path;
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/SERVER/auth_link_API.dart';
import 'package:apartment_tow/core/SERVER/root_link_api.dart';
import 'package:apartment_tow/core/error/exceptions.dart';
import 'package:apartment_tow/core/functions/image_progress.dart';
import 'package:apartment_tow/core/upload_packge/upload_File.dart';
import 'package:apartment_tow/featuers/auth/data/model/user_model.dart';

abstract class AuthRemoteDataSource extends GetConnect {
  Future<UserModel> signIn({required String email, required String passowrd});
  Future<UserModel> getUser({required int id});
  Future<Unit> sendCode({required String email, required String passowrd});
  Future<Unit> verifyCode({required String code, required String email});
  Future<UserModel> signUp({required UserModel userModel});
  Future<Unit> forgetPasswordsendCode({required String email});
  Future<UserModel> foregetPasswordRestPassword(
      {required String email, required String newPassword});
  Future<Unit> foregetPasswordVerifyCode(
      {required String code, required String email});
  Future<Unit> restPassword(
      {required int id,
      required String oldPassword,
      required String newPasswored});
  Future<UserModel> deleteUserProfie({required int id});
  Future<UserModel> setProfile({required int id, required File image});
  Future<UserModel> updateUser({required UserModel userModle, File? image});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<UserModel> signIn(
      {required String email, required String passowrd}) async {
    final body = {
      "email": email,
      "password": passowrd,
    };
    final response = await post(AuthLinkAPI.signIn, jsonEncode(body));
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "success") {
        final userData = jsonData['data'];
        return UserModel.fromJson(userData);
      } else {
        if (jsonData['message'] == "email-not-found") {
          throw EmailWrongExeption();
        } else if (jsonData['message'] == "password-wrong") {
          throw PassowrdWrongExeption();
        } else if (jsonData['message'] == 'email-not-verify') {
          throw EmailWrongExeption();
        } else {
          throw UnexpectedErrorException();
        }
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUser({required int id}) async {
    final body = {
      "id": id,
    };
    final response = await post(AuthLinkAPI.getUser, jsonEncode(body));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "success") {
        final userData = jsonData['data'];
        return UserModel.fromJson(userData);
      } else {
        throw UnexpectedErrorException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> sendCode(
      {required String email, required String passowrd}) async {
    final body = {
      "email": email,
      "password": passowrd,
    };
    final response = await post(AuthLinkAPI.sendCode, jsonEncode(body));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "success") {
        return unit;
      } else {
        if (jsonData['message'] == 'Email-exists') {
          throw EmailExistsExeption();
        } else {
          throw UnexpectedErrorException();
        }
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> verifyCode({required String code, required String email}) async {
    final body = {
      "code": code,
      "email": email,
    };
    final response = await post(AuthLinkAPI.verifiyCode, jsonEncode(body));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "success") {
        return unit;
      } else {
        if (jsonData['message'] == "time") {
          throw TimeDoneException();
        } else if (jsonData['message'] == "code") {
          throw CodeIsWrongExeption();
        } else {
          throw UnexpectedErrorException();
        }
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> restPassword(
      {required int id,
      required String oldPassword,
      required String newPasswored}) async {
    final body = {
      "userID": id,
      "oldPassword": oldPassword,
      "newPassword": newPasswored,
    };
    final response = await post(AuthLinkAPI.restPassword, jsonEncode(body));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "success") {
        return unit;
      } else {
        if (jsonData['message'] == "incorrect-password") {
          throw PassowrdWrongExeption();
        } else {
          throw UnexpectedErrorException();
        }
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> signUp({required UserModel userModel}) async {
    final body = userModel.toJson();
    final response = await post(AuthLinkAPI.signUp, jsonEncode(body));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "success") {
        final userData = jsonData['data'];
        return UserModel.fromJson(userData);
      } else {
        throw UnexpectedErrorException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> foregetPasswordRestPassword(
      {required String email, required String newPassword}) async {
    final body = {
      "email": email,
      "password": newPassword,
    };

    final response = await post(AuthLinkAPI.fPrestPassword, jsonEncode(body));


    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "success") {
        final userDate = jsonData['data'];
        return UserModel.fromJson(userDate);
      } else {
        if (jsonData['message'] == "rest-password") {
          throw OperationNotCompletedException();
        } else {
          throw UnexpectedErrorException();
        }
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> forgetPasswordsendCode({required String email}) async {
    final body = {
      "email": email,
    };
    final response = await post(AuthLinkAPI.fPsendCode, jsonEncode(body));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "success") {
        return unit;
      } else {
        if (jsonData['message'] == 'email-not-found') {
          throw EmailWrongExeption();
        } else {
          throw OperationNotCompletedException();
        }
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> foregetPasswordVerifyCode(
      {required String code, required String email}) async {
    final body = {
      "code": code,
      "email": email,
    };
    final response = await post(AuthLinkAPI.fPverifyCode, jsonEncode(body));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "success") {
        return unit;
      } else {
        if (jsonData['message'] == "time") {
          throw TimeDoneException();
        } else if (jsonData['message'] == "code") {
          throw CodeIsWrongExeption();
        } else {
          throw UnexpectedErrorException();
        }
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> setProfile({required int id, required File image}) async {
    File newImage = resizeImage(image);
    String imageName = path.basename(newImage.path);
    String _image = base64Encode(newImage.readAsBytesSync());
    final body = {
      "id": id,
      "name": imageName,
      "image": _image,
    };
    final response = await post(AuthLinkAPI.setProfile, jsonEncode(body));
    if (response.statusCode == 200) {
      final jsonDate = jsonDecode(response.body);
      if (jsonDate['status'] == "success") {
        final userData = jsonDate['data'];
        return UserModel.fromJson(userData);
      } else {
        throw UnexpectedErrorException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> updateUser(
      {required UserModel userModle, File? image}) async {
    Map body = userModle.toJson();
    body['image'] = null;
    if (image != null) {
      File? newImage;
      String url = "";
      if (Platform.isAndroid) {
        newImage = await resizeImage(image);
        url = await UploaidFilesImpl().uploadFile(
          foleder: "profiles",
          file: newImage!,
          url: uploadFileLink,
        );
      } else {
        url = await UploaidFilesImpl().uploadFile(
            foleder: "profiles",
            file: image,
            url: uploadFileLink,
            data: {"folderName": "profiles"});
      }
      body['image'] = url;
    }
    final response = await post(AuthLinkAPI.updateUser, jsonEncode(body));
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "success") {
        final userData = jsonData['data'];
        return UserModel.fromJson(userData);
      } else {
        throw OperationNotCompletedException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> deleteUserProfie({required int id}) async {
    final body = {"id": id};
    final response = await post(AuthLinkAPI.deleteProfile, jsonEncode(body));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "success") {
        final userData = jsonData['data'];
        return UserModel.fromJson(userData);
      } else {
        throw OperationNotCompletedException();
      }
    } else {
      throw ServerException();
    }
  }
}
