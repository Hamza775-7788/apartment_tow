import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/shared/dialgos_widgets.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';
import 'package:apartment_tow/featuers/auth/presntaion/controller/Auth_controller.dart';

class VerfiyCodeViewModel {
  final String email;
  final String password;
  final User user;
  VerfiyCodeViewModel(
      {required this.password, required this.user, required this.email});

  int counter = 120;

  final SignInAndSignUpControllerImpl _controller = Get.find();
  String title = "تفقد بريدك الاكتروني ".tr;
  String body = "قم بادخال كود التحقق الذي تم ارساله الى بريد الاكتروني".tr;
  String verifyCodeLable = "كود التحقق".tr;
  String resndCodeLable = "اعد ارسال الرمز".tr;
  String sendButton = "ارسال".tr;
  late TextEditingController verifyCodeControlelr;
  void verifyCode() {
    if (verifyCodeControlelr.text.isEmpty) {
      Get.dialog(ErorrDilaog(message: "لا يمكن ان يكون الحقل فارغ".tr));
    } else {
      _controller.verifyCode(
          user: user, code: verifyCodeControlelr.text, email: email);
    }
  }

  void incerment() async {
    await Future.delayed(const Duration(seconds: 1));
    counter--;
  }

  void resendCode() {
    _controller.resendCode(email: email, passowrd: password);
  }
}
