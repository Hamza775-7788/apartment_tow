import 'package:get/get.dart';
import 'package:apartment_tow/core/localization/local_page_.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/user/get_use_info_use_case.dart';
import 'package:apartment_tow/featuers/auth/presntaion/pages/sign_view.dart';
import 'package:apartment_tow/featuers/home_view.dart';
import 'package:apartment_tow/main.dart';

abstract class SplashController extends GetxController {
  Future<void> getUserInfo();
}

class SplashControllerImpl extends SplashController {
  final AuthGetUserInfoUsecase _getUserInfoUsecase;

  SplashControllerImpl({required AuthGetUserInfoUsecase getUserInfoUsecase})
      : _getUserInfoUsecase = getUserInfoUsecase;

  @override
  Future<void> getUserInfo() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await _getUserInfoUsecase();
    response.fold((l) {
      if (controllerImpl!.appLocal == null) {
        Get.offAll(
            () => LocalPageView(
                  onNavigator: () {
                    Get.offAll(() => const SignViewPage(),
                        transition: Transition.rightToLeft);
                  },
                ),
            transition: Transition.rightToLeft);
      } else {
        Get.offAll(() => const SignViewPage(),
            transition: Transition.rightToLeft);
      }
    }, (r) {
      if (controllerImpl!.appLocal == null) {
        Get.offAll(
            () => LocalPageView(
                  onNavigator: () {
                    Get.offAll(() => const MainViewPage(),
                        transition: Transition.rightToLeft);
                  },
                ),
            transition: Transition.rightToLeft);
      } else {
        Get.offAll(() => const MainViewPage(),
            transition: Transition.rightToLeft);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }
}
