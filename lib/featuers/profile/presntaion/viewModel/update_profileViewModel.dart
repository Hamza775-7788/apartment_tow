import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';
import 'package:apartment_tow/featuers/profile/presntaion/controller/profileController.dart';
import 'package:apartment_tow/main.dart';

class UpdateProfileViewModel {
  UpdateProfileViewModel() {
    getData();
  }

  getData() async {
    await _controllerImpl.getUserInfo();
    nameController.text = _controllerImpl.userInfo!.name;
    emailController.text = _controllerImpl.userInfo!.email;
    phoneController.text = _controllerImpl.userInfo!.phone ?? "";
    image = _controllerImpl.userInfo!.profile;
  }

  String? image;

  PrfileControllerImpl _controllerImpl =
      Get.put(getIt!<PrfileControllerImpl>());

  String title = "الملف الشخصي".tr;
  String emailLable = "البريد الاكتروني".tr;
  String phoneLable = "رقم الهاتف".tr;
  String nameLable = "الاسم".tr;
  String buttonUpdateLable = "حفظ".tr;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  onSave() async {
    User user = User(
        id: _controllerImpl.userInfo!.id,
        name: nameController.text,
        email: emailController.text,
        type: _controllerImpl.userInfo!.type,
        phone: phoneController.text);
    await _controllerImpl.updateUser(user: user);
  }

  File? get imagePicker {
    return _controllerImpl.image;
  }

  onSelectImage() {
    _controllerImpl.selectImage();
  }

  Future<void> onCancel() async {
    _controllerImpl.image = null;
  }
}
