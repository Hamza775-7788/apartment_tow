import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/shared/dialgos_widgets.dart';
import 'package:apartment_tow/featuers/auth/presntaion/controller/forgetPassword_controller.dart';
import 'package:apartment_tow/main.dart';

class ForegetPasswordViewModel {
  ForegetPasswordControllerImp _controllerImp =
      Get.put(getIt!<ForegetPasswordControllerImp>());
  String title = "نسيت كلمه السر".tr;
  String body = "سوف نقوم بارسال رمز التحقق الى بريدك الاكتروني".tr;
  String emailLabal = "البريد الاكتروني".tr;
  String emailHint = "exampl@exampl.com";
  String buttonSend = "ارسال رمز التحقق".tr;
  late TextEditingController emailController;

  void sendCode() async {
    if (emailController.text.isEmpty) {
      Get.dialog(ErorrDilaog(message: "لا يمكن ان يكون الحقل فارغ".tr));
    } else if (emailController.text.isEmail) {
      await _controllerImp.sendCode(email: emailController.text);
    } else {
      Get.dialog(ErorrDilaog(message: "يجب ادخال بريد اكتروني صحيح".tr));
    }
  }
}
