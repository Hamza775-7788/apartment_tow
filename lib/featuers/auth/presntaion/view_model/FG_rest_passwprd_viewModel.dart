import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/shared/dialgos_widgets.dart';
import 'package:apartment_tow/featuers/auth/presntaion/controller/forgetPassword_controller.dart';
import 'package:apartment_tow/main.dart';

class FGRestPasswordViewModel {
  final String email;
  FGRestPasswordViewModel({required this.email});
  ForegetPasswordControllerImp _controllerImp =
      Get.put(getIt!<ForegetPasswordControllerImp>());
  String title = " تعين كلمه المرور".tr;
  String body = "ادخل كلمه المرور الجديده".tr;
  String passowrdHint = "كلمه المرور".tr;
  String buttonRest = "اعاده التعيين".tr;

  late TextEditingController newPasswordController;

  void restPassowrd() async {
    if (newPasswordController.text.length < 6) {
      Get.dialog( ErorrDilaog(message: "كلمة المرور عير كافيه".tr));
    } else {
      await _controllerImp.restPassword(
          email: email, newPassword: newPasswordController.text);
    }
  }
}
