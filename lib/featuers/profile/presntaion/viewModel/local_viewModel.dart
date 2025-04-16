import 'package:get/get.dart';
import 'package:apartment_tow/core/localization/local_controller.dart';
import 'package:apartment_tow/main.dart';

class LocalizationViewModel {
  String title = "اختر لغة التطبيق".tr;
  String arabicLable = "العربية".tr;
  String englash = "الانجليزية".tr;

  LocalContollerImplment _contollerImplment =
      Get.put(getIt!<LocalContollerImplment>());

  String get local {
    return _contollerImplment.localCached;
  }

  setLocal(String newLocal) {
    _contollerImplment.setLocal(newLocal);
  }
}
