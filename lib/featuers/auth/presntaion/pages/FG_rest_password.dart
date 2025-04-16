import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/constant/images.dart';
import 'package:apartment_tow/core/functions/get_text_size_functions.dart';
import 'package:apartment_tow/core/shared/buttons.dart';
import 'package:apartment_tow/core/shared/my_text_filed.dart';
import 'package:apartment_tow/featuers/auth/presntaion/view_model/FG_rest_passwprd_viewModel.dart';

class FGrestPasswordView extends StatefulWidget {
  final String email;
  const FGrestPasswordView({required this.email, super.key});

  @override
  State<FGrestPasswordView> createState() => _FGrestPasswordViewState();
}

class _FGrestPasswordViewState extends State<FGrestPasswordView> {
  late FGRestPasswordViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = FGRestPasswordViewModel(email: widget.email);
    viewModel.newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.newPasswordController.dispose();
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
          Image.asset(
            AppImages.restPassowrd,
            height: getTextSize(fontSize: 150),
            color: Get.theme.colorScheme.primary,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              viewModel.title,
              style: TextStyle(
                  fontSize: getTextSize(fontSize: 23),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              viewModel.body,
              style: TextStyle(
                  fontSize: getTextSize(fontSize: 20),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            viewModel.passowrdHint,
            style: TextStyle(
              fontSize: getTextSize(fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          MyCustomRequiredTextFiled(
              icon: Icon(
                Icons.key_outlined,
                color: Get.theme.colorScheme.primary,
              ),
              hint: "",
              controller: viewModel.newPasswordController),
          const SizedBox(height: 5),
          SizedBox(height: getTextSize(fontSize: 50)),
          MyGenralButton(
            name: viewModel.buttonRest,
            onPressed: () {
              viewModel.restPassowrd();
            },
          )
        ],
      ),
    );
  }
}
