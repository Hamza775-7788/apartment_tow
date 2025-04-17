// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/shared/dialgos_widgets.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';
import 'package:apartment_tow/featuers/auth/presntaion/controller/Auth_controller.dart';

class RegesterViewModel {
  final int userType;
  RegesterViewModel({required this.userType});
  final SignInAndSignUpControllerImpl _controller = Get.find();
  String title = "انشاء حساب جديد".tr;
  String body = "قم بملء جيمع الحقول التالية لانشاء الحساب".tr;
  String nameLable = "الاسم".tr;
  String emailLabal = "البريد الاكتروني".tr;
  String confermPasswordLable = "نأكيد كلمة السر".tr;
  String phoneNumperLable = "رقم الهاتف".tr;
  String optinal = "اختياري".tr;
  String signIn = "تسجيل الدخول".tr;
  String namehint = "الاسم الثلاثي على الاقل".tr;
  String passowrdHint = "يجب ان تكون اكبر من 6 احرف او ارقام".tr;
  String confermPasswordHint = "يجب ان تكون متطابقة".tr;
  String emailHint = "exampl@exampl.com";
  String passwordLabal = "كلمة السر".tr;
  String buttonSignUp = "انشاء الحساب".tr;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confermPasswordController =
      TextEditingController();

  void sendCode() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confermPasswordController.text.isEmpty) {
      Get.dialog(ErorrDilaog(message: "يجب ملء الحقول كامل".tr));
    } else if (userType == 1 && phoneController.text.isEmpty) {
      Get.dialog(ErorrDilaog(message: "يجب اضافة رقم الهاتف".tr));
    } else if (passwordController.text.length < 6) {
      Get.dialog(ErorrDilaog(message: "كلمة المرور عير كافيه".tr));
    } else if (passwordController.text != confermPasswordController.text) {
      Get.dialog(ErorrDilaog(message: "كلمه السر غير متطابقة".tr));
    } else if (nameController.text.trim().split(" ").length < 3) {
      Get.dialog(ErorrDilaog(message: "الاسم غير كافي ".tr));
    } else {
      if (emailController.text.trim().isEmail) {
        User user = User(
          id: 0,
          name: nameController.text,
          email: emailController.text,
          type: userType,
          phone: phoneController.text,
        );

        _controller.sendCode(
          user: user,
          email: emailController.text,
          passowrd: passwordController.text,
        );
      } else {
        Get.dialog(ErorrDilaog(message: "يجب ادخال بريد اكتروني صحيح".tr));
      }
    }
  }

  void goToSignIn() {
    Get.back();
  }
}
