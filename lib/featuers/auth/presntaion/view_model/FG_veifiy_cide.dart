import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/featuers/auth/presntaion/controller/forgetPassword_controller.dart';

class FGerfiycodeViewModle {
  final String email;
  FGerfiycodeViewModle({required this.email});

  ForegetPasswordControllerImp _controllerImp = Get.find();
  String title = "تفقد بريدك الاكتروني ".tr;
  String body = "قم بادخال كود التحقق الذي تم ارساله الى بريد الاكتروني".tr;
  String verifyCodeLable = "كود التحقق".tr;
  String resndCodeLable = "اعد ارسال الرمز".tr;
  String sendButton = "ارسال".tr;
  late TextEditingController verifyCodeControlelr;

  void sendCode() async {
    _controllerImp.verfiyCode(code: verifyCodeControlelr.text, email: email);
  }
}
