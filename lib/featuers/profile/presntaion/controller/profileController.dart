import 'dart:io';

import 'package:apartment_tow/featuers/auth/domain/use_cases/user/get_use_info_use_case.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:apartment_tow/core/functions/handleMessage_function.dart.dart';
import 'package:apartment_tow/core/local_api/local_data_source.dart';
import 'package:apartment_tow/core/shared/cutsom_loding_dialog.dart';
import 'package:apartment_tow/core/shared/dialgos_widgets.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/user/update_user_use_case.dart';
import 'package:apartment_tow/featuers/auth/presntaion/pages/sign_view.dart';

abstract class PrfileController extends GetxController {
  Future<void> getUserInfo();
  signOut();
}

class PrfileControllerImpl extends PrfileController {
  final AuthGetUserInfoUsecase _getUserInfoUsecase;
  final AuthUpdateUserUsecase _updateUserUsecase;
  final ImagePicker _imagePicker;
  final LocalDataSource _localDataSource;

  User? userInfo;
  File? image;

  PrfileControllerImpl({
    required ImagePicker imagePicker,
    required AuthGetUserInfoUsecase getUserInfoUsecase,
    required AuthUpdateUserUsecase updateUserUsecase,
    required LocalDataSource localDataSource,
  }) : _getUserInfoUsecase = getUserInfoUsecase,
       _localDataSource = localDataSource,
       _imagePicker = imagePicker,
       _updateUserUsecase = updateUserUsecase;

  Future<void> selectImage() async {
    final XFile? imageFormPicker = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFormPicker != null) {
      image = File(imageFormPicker.path);
      update();
    }
  }

  @override
  Future<void> getUserInfo() async {
    final response = await _getUserInfoUsecase();
    response.fold(
      (failure) {
        handleError(failure);
      },
      (reomteUser) {
        userInfo = reomteUser;
        update();
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  @override
  signOut() async {
    Get.dialog(
      WoringDilaog(
        onSkip: () async {
          await _localDataSource.signOut();
          Get.offAll(
            () => const SignViewPage(),
            transition: Transition.rightToLeft,
          );
        },
        title: "تسجيل الخروج",
        message: "هل انت متاكد من تسجيل الخروج",
      ),
    );
  }

  Future<void> updateUser({required User user}) async {
    showLoding();
    try {
      final response = await _updateUserUsecase(user: user, image: image);
      Get.back();
      response.fold(
        (failure) {
          handleError(failure);
        },
        (r) async {
          handleSuccess();
          getUserInfo();
          Get.back();
          await Future.delayed(const Duration(milliseconds: 500));
          update();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErorrDilaog(message: '$e'));
    }
  }
}
