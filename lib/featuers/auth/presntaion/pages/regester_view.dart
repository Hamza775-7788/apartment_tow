// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/functions/get_text_size_functions.dart';
import 'package:apartment_tow/core/shared/buttons.dart';
import 'package:apartment_tow/core/shared/my_text_filed.dart';
import 'package:apartment_tow/featuers/auth/presntaion/view_model/regester_view_model.dart';

class RegesterView extends StatefulWidget {
  const RegesterView({super.key});

  @override
  State<RegesterView> createState() => _RegesterViewState();
}

class _RegesterViewState extends State<RegesterView> {
  RegesterViewModel _viewModel = RegesterViewModel();
  @override
  void initState() {
    super.initState();
    _viewModel.emailController = TextEditingController();
    _viewModel.passwordController = TextEditingController();
    _viewModel.nameController = TextEditingController();
    _viewModel.confermPasswordController = TextEditingController();
    _viewModel.phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _viewModel.emailController.dispose();
    _viewModel.passwordController.dispose();
    _viewModel.nameController.dispose();
    _viewModel.confermPasswordController.dispose();
    _viewModel.phoneController.dispose();
    super.dispose();
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
          Text(
            _viewModel.title,
            style: TextStyle(
              fontSize: getTextSize(fontSize: 23),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _viewModel.body,
            style: TextStyle(
              fontSize: getTextSize(fontSize: 23),
            ),
          ),
          Text(
            _viewModel.nameLable,
            style: TextStyle(
              fontSize: getTextSize(fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          MyCustomRequiredTextFiled(
            hint: _viewModel.namehint,
            controller: _viewModel.nameController,
          ),
          const SizedBox(height: 16),
          Text(
            _viewModel.emailLabal,
            style: TextStyle(
              fontSize: getTextSize(fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          MyCustomRequiredTextFiled(
            hint: _viewModel.emailHint,
            controller: _viewModel.emailController,
            icon: Icon(
              Icons.email_outlined,
              color: Get.theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _viewModel.phoneNumperLable,
            style: TextStyle(
              fontSize: getTextSize(fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          MyCustomRequiredTextFiled(
            isNumber: true,
            hint: _viewModel.optinal,
            controller: _viewModel.phoneController,
          ),
          const SizedBox(height: 16),
          Text(
            _viewModel.passwordLabal,
            style: TextStyle(
              fontSize: getTextSize(fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          MyCustomRequiredTextFiled(
            isPassword: true,
            hint: _viewModel.passowrdHint,
            controller: _viewModel.passwordController,
          ),
          const SizedBox(height: 16),
          Text(
            _viewModel.confermPasswordLable,
            style: TextStyle(
              fontSize: getTextSize(fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          MyCustomRequiredTextFiled(
            isPassword: true,
            hint: _viewModel.confermPasswordHint,
            controller: _viewModel.confermPasswordController,
          ),
          const SizedBox(height: 16),
          MyGenralButton(
            name: _viewModel.buttonSignUp,
            onPressed: () {
              _viewModel.sendCode();
            },
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              _viewModel.goToSignIn();
            },
            child: Text(
              _viewModel.signIn,
              style: TextStyle(fontSize: getTextSize(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
