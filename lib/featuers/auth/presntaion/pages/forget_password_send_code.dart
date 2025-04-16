import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/constant/images.dart';
import 'package:apartment_tow/core/functions/get_text_size_functions.dart';
import 'package:apartment_tow/core/shared/buttons.dart';
import 'package:apartment_tow/core/shared/my_text_filed.dart';
import 'package:apartment_tow/featuers/auth/presntaion/view_model/fotget_password_view_mode;.dart';

class ForegetPasswordView extends StatefulWidget {
  final String? email;
  const ForegetPasswordView({required this.email, super.key});

  @override
  State<ForegetPasswordView> createState() => _ForegetPasswordViewState();
}

class _ForegetPasswordViewState extends State<ForegetPasswordView> {
  ForegetPasswordViewModel viewModel = ForegetPasswordViewModel();

  @override
  void initState() {
    viewModel.emailController = TextEditingController();
    viewModel.emailController.text = widget.email ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.colorScheme.background,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Image.asset(
            AppImages.forgotPassword,
            height: getTextSize(fontSize: 150),
            color: Get.theme.colorScheme.primary,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              viewModel.title,
              style: TextStyle(
                fontSize: getTextSize(fontSize: 25),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              viewModel.body,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getTextSize(fontSize: 25),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Text(
            viewModel.emailLabal,
            style: TextStyle(
              fontSize: getTextSize(fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          MyCustomRequiredTextFiled(
            hint: viewModel.emailHint,
            controller: viewModel.emailController,
          ),
          const SizedBox(height: 30),
          MyGenralButton(
            name: viewModel.buttonSend,
            onPressed: () {
              viewModel.sendCode();
            },
          ),
        ],
      ),
    );
  }
}
