// ignore_for_file: unused_import

import 'package:apartment_tow/core/localization/local.dart';
import 'package:apartment_tow/core/localization/local_controller.dart';
import 'package:apartment_tow/core/theme/app_theme.dart';
import 'package:apartment_tow/featuers/auth/presntaion/pages/splashScreen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'injection_container.dart' as di;
// import 'package:device_preview/device_preview.dart';

GetIt? getIt;
LocalContollerImplment? controllerImpl;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  getIt = di.sl;
  controllerImpl = Get.put(getIt!<LocalContollerImplment>());
  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => MyApp(), // Wrap your app
  //   ),
  // );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Mylocal(),
      locale: controllerImpl!.appLocal ?? const Locale("en"),
      theme: lightMode(context: context),
      home: SplashScreenView(),
    );
  }
}
