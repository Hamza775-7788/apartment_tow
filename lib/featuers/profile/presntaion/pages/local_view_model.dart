import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/functions/get_text_size_functions.dart';
import 'package:apartment_tow/core/localization/local_controller.dart';
import 'package:apartment_tow/featuers/profile/presntaion/viewModel/local_viewModel.dart';

class LocalizationViewPage extends StatefulWidget {
  const LocalizationViewPage({super.key});

  @override
  State<LocalizationViewPage> createState() => LlocalizationStateViewPage();
}

class LlocalizationStateViewPage extends State<LocalizationViewPage> {
  LocalizationViewModel viewModel = LocalizationViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          color: Get.theme.colorScheme.secondary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: GetBuilder<LocalContollerImplment>(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              viewModel.title,
              style: TextStyle(
                fontSize: getTextSize(fontSize: 23),
                color: Get.theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            RadioListTile(
              title: Text(viewModel.arabicLable),
              value: "ar",
              groupValue: viewModel.local,
              onChanged: (data) {
                viewModel.setLocal("ar");
              },
            ),
            RadioListTile(
              title: Text(viewModel.englash),
              value: "en",
              groupValue: viewModel.local,
              onChanged: (data) {
                viewModel.setLocal("en");
              },
            ),
          ],
        );
      }),
    );
  }
}
