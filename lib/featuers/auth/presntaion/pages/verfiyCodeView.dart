import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/constant/images.dart';
import 'package:apartment_tow/core/functions/get_text_size_functions.dart';
import 'package:apartment_tow/core/shared/buttons.dart';
import 'package:apartment_tow/core/shared/my_text_filed.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';
import 'package:apartment_tow/featuers/auth/presntaion/view_model/verfiyCodeViewModel.dart';

class VerfiyCodeView extends StatefulWidget {
  final String email;
  final String password;
  final User user;
  const VerfiyCodeView({
    required this.password,
    required this.user,
    required this.email,
    super.key,
  });

  @override
  State<VerfiyCodeView> createState() => _VerfiyCodeViewState();
}

class _VerfiyCodeViewState extends State<VerfiyCodeView> {
  late VerfiyCodeViewModel _viewModel;
  @override
  void initState() {
    _viewModel = VerfiyCodeViewModel(
        password: widget.password, user: widget.user, email: widget.email);
    _viewModel.verifyCodeControlelr = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.verifyCodeControlelr.dispose();
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
          Image.asset(
            AppImages.verfiyCode,
            height: getTextSize(fontSize: 150),
            color: Get.theme.colorScheme.primary,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              _viewModel.title,
              style: TextStyle(
                  fontSize: getTextSize(fontSize: 23),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              _viewModel.body,
              style: TextStyle(
                  fontSize: getTextSize(fontSize: 20),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            _viewModel.verifyCodeLable,
            style: TextStyle(
              fontSize: getTextSize(fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          MyPinTextFiled(controller: _viewModel.verifyCodeControlelr),
          const SizedBox(height: 5),
          Row(
            children: [
              Flexible(
                child: TextButton(
                  onPressed: () {
                    _viewModel.resendCode();
                  },
                  child: FittedBox(
                    child: Text(
                      _viewModel.resndCodeLable,
                      style: TextStyle(
                          fontSize: 20, color: Get.theme.colorScheme.primary),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getTextSize(fontSize: 50)),
          MyGenralButton(
            name: _viewModel.sendButton,
            onPressed: () {
              _viewModel.verifyCode();
            },
          )
        ],
      ),
    );
  }
}
