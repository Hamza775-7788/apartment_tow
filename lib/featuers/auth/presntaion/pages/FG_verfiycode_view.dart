import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/constant/images.dart';
import 'package:apartment_tow/core/shared/buttons.dart';
import 'package:apartment_tow/core/shared/my_text_filed.dart';
import 'package:apartment_tow/featuers/auth/presntaion/view_model/FG_veifiy_cide.dart';

import '../../../../core/functions/get_text_size_functions.dart';

class FPverfiyCodeView extends StatefulWidget {
  final String email;
  const FPverfiyCodeView({
    required this.email,
    super.key,
  });

  @override
  State<FPverfiyCodeView> createState() => _FPverfiyCodeViewState();
}

class _FPverfiyCodeViewState extends State<FPverfiyCodeView> {
  late FGerfiycodeViewModle viewModle;
  @override
  void initState() {
    super.initState();
    viewModle = FGerfiycodeViewModle(email: widget.email);
    viewModle.verifyCodeControlelr = TextEditingController();
  }

  @override
  void dispose() {
    viewModle.verifyCodeControlelr.dispose();
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
              viewModle.title,
              style: TextStyle(
                  fontSize: getTextSize(fontSize: 23),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              viewModle.body,
              style: TextStyle(
                  fontSize: getTextSize(fontSize: 20),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            viewModle.verifyCodeLable,
            style: TextStyle(
              fontSize: getTextSize(fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          MyPinTextFiled(controller: viewModle.verifyCodeControlelr),
          const SizedBox(height: 5),
          Row(
            children: [
              Flexible(
                child: TextButton(
                  onPressed: () {},
                  child: FittedBox(
                    child: Text(
                      viewModle.resndCodeLable,
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
            name: viewModle.sendButton,
            onPressed: () {
              viewModle.sendCode();
            },
          )
        ],
      ),
    );
  }
}
