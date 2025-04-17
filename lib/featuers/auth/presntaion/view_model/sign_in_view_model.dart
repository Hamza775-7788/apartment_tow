import 'package:apartment_tow/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:apartment_tow/featuers/auth/presntaion/controller/Auth_controller.dart';
import 'package:apartment_tow/featuers/auth/presntaion/pages/forget_password_send_code.dart';
import 'package:apartment_tow/featuers/auth/presntaion/pages/regester_view.dart';
import 'package:apartment_tow/main.dart';

class SignInViewModel {
  final SignInAndSignUpControllerImpl _controller = Get.put(
    getIt!<SignInAndSignUpControllerImpl>(),
  );

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
      email: emailController.text,
      passowrd: passwordController.text,
    );
  }

  void goToSignUp() {
    registerTypeView();
  }

  void loginVeister() {}
  void goToForgetPassword() {
    Get.to(
      () => ForegetPasswordView(email: emailController.text),
      transition: Transition.rightToLeft,
    );
  }
}

registerTypeView() {
  Get.bottomSheet(RegisterTypeView());
}

class RegisterTypeView extends StatefulWidget {
  const RegisterTypeView({super.key});

  @override
  State<RegisterTypeView> createState() => _RegisterTypeViewState();
}

class _RegisterTypeViewState extends State<RegisterTypeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        color: Get.theme.colorScheme.secondary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("حدد ماهو حسابك ؟".tr, style: AppTextStyles.normaBoldlTitle()),
          ListTile(
            onTap: () {
              Get.back();
              Get.to(
                () => RegesterView(userType: 0),
                transition: Transition.leftToRight,
              );
            },
            title: Text("عميل".tr, style: AppTextStyles.normalTitle()),
            subtitle: Text(
              "يقوم بتصفح الشقق المعروضة للأيجار ورفع طلبات تأجير ".tr,
              style: AppTextStyles.description,
            ),
          ),
          Divider(
            endIndent: 10,
            indent: 10,
            color: Get.theme.colorScheme.primary,
            thickness: 0.5,
          ),
          ListTile(
            onTap: () {
              Get.back();
              Get.to(
                () => RegesterView(userType: 1),
                transition: Transition.leftToRight,
              );
            },
            title: Text("مؤجر".tr, style: AppTextStyles.normalTitle()),
            subtitle: Text(
              "يقوم بعرض الشقق للبيع والتعامل مع طلبات التأجير".tr,
              style: AppTextStyles.description,
            ),
          ),
        ],
      ),
    );
  }
}
