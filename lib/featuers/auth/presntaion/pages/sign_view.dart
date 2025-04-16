// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/constant/images.dart';
import 'package:apartment_tow/core/functions/get_text_size_functions.dart';
import 'package:apartment_tow/core/shared/buttons.dart';
import 'package:apartment_tow/core/shared/my_text_filed.dart';
import 'package:apartment_tow/featuers/auth/presntaion/view_model/sign_in_view_model.dart';

class SignViewPage extends StatefulWidget {
  const SignViewPage({super.key});

  @override
  State<SignViewPage> createState() => _SignViewPageState();
}

class _SignViewPageState extends State<SignViewPage> {
  SignInViewModel _viewModel = SignInViewModel();
  @override
  void initState() {
    _viewModel.emailController = TextEditingController();
    _viewModel.passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.passwordController.dispose();
    _viewModel.emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: getTextSize(fontSize: 100)),
          Image.asset(
            AppIcons.logo,
            color: Get.theme.colorScheme.primary,
            height: getTextSize(fontSize: 150),
          ),
          const SizedBox(height: 16),
          Container(
            alignment: Alignment.center,
            child: Text(
              _viewModel.welcomText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getTextSize(fontSize: 25),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              _viewModel.signInFirst,
              style: TextStyle(fontSize: getTextSize(fontSize: 23)),
            ),
          ),
          const SizedBox(height: 80),
          Text(
            _viewModel.emailLabal,
            style: TextStyle(fontSize: getTextSize(fontSize: 20)),
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
            _viewModel.passwordLabal,
            style: TextStyle(fontSize: getTextSize(fontSize: 20)),
          ),
          const SizedBox(height: 5),
          MyCustomRequiredTextFiled(
            isPassword: true,
            icon: Icon(
              Icons.key_outlined,
              color: Get.theme.colorScheme.primary,
            ),
            hint: _viewModel.passwordHint,
            controller: _viewModel.passwordController,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: TextButton(
                  onPressed: () {
                    _viewModel.goToForgetPassword();
                  },
                  child: FittedBox(
                    child: Text(
                      _viewModel.forgetPassword,
                      style: TextStyle(
                        fontSize: 20,
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          MyGenralButton(
            name: _viewModel.buttonSignIn,
            onPressed: () {
              _viewModel.signIn();
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: FittedBox(
                  child: TextButton(
                    onPressed: () {
                      _viewModel.goToSignUp();
                    },
                    child: Text(
                      _viewModel.createAccount,
                      style: TextStyle(fontSize: getTextSize(fontSize: 20)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: FittedBox(
                  child: Text(
                    _viewModel.or,
                    style: TextStyle(fontSize: getTextSize(fontSize: 20)),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: FittedBox(
                  child: TextButton(
                    onPressed: () {
                      _viewModel.loginVeister();
                    },
                    child: Text(
                      _viewModel.vesiterLogin,
                      style: TextStyle(fontSize: getTextSize(fontSize: 20)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
