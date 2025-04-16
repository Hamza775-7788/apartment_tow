import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:apartment_tow/featuers/auth/presntaion/controller/Auth_controller.dart';
import 'package:apartment_tow/featuers/auth/presntaion/pages/forget_password_send_code.dart';
import 'package:apartment_tow/featuers/auth/presntaion/pages/regester_view.dart';
import 'package:apartment_tow/main.dart';

class SignInViewModel {
  final SignInAndSignUpControllerImpl _controller =
      Get.put(getIt!<SignInAndSignUpControllerImpl>());

  String buttonSignIn = "تسجيل الدخول".tr;
  String welcomText = "اهلاً بك !".tr;
  String signInFirst = "قم بتسجيل الدخول".tr;
  String emailHint = "exampl@exampl.com";
  String passwordHint = "xxxxxxxxxx";
  String vesiterLogin = "الدخول كزائر".tr;
  String createAccount = "انشاء حساب".tr;
  String or = "او".tr;
  String emailLabal = "البريد الاكتروني".tr;
  String passwordLabal = "كلمة السر".tr;
  String forgetPassword = "نسيت كلمه المرور؟".tr;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  void signIn() async {
    await _controller.signin(
        email: emailController.text, passowrd: passwordController.text);
  }

  void goToSignUp() {
    Get.to(() => const RegesterView(), transition: Transition.leftToRight);
  }

  void loginVeister() {}
  void goToForgetPassword() {
    Get.to(
        () => ForegetPasswordView(
              email: emailController.text,
            ),
        transition: Transition.rightToLeft);
  }
}
