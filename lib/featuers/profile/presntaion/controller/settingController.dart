import 'package:get/get.dart';
import 'package:apartment_tow/core/functions/handleMessage_function.dart.dart';
import 'package:apartment_tow/core/local_api/local_data_source.dart';
import 'package:apartment_tow/core/shared/dialgos_widgets.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/user/get_use_info_use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/user/update_user_use_case.dart';
import 'package:apartment_tow/featuers/auth/presntaion/pages/sign_view.dart';

abstract class SettingController extends GetxController {
  Future<void> getUserInfo();
  signOut();
}

class SettingControllerImpl extends SettingController {
  final AuthGetUserInfoUsecase _getUserInfoUsecase;
  final AuthUpdateUserUsecase _updateUserUsecase;

  final LocalDataSource _localDataSource;

  User? userInfo;

  SettingControllerImpl({
    required AuthGetUserInfoUsecase getUserInfoUsecase,
    required AuthUpdateUserUsecase updateUserUsecase,
    required LocalDataSource localDataSource,
  })  : _getUserInfoUsecase = getUserInfoUsecase,
        _localDataSource = localDataSource,
        _updateUserUsecase = updateUserUsecase;
  @override
  Future<void> getUserInfo() async {
    final response = await _getUserInfoUsecase();
    response.fold((failure) {
      handleError(failure);
    }, (reomteUser) {
      userInfo = reomteUser;
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  @override
  signOut() async {
    Get.dialog(WoringDilaog(
        onSkip: () async {
          await _localDataSource.signOut();
          Get.offAll(() => const SignViewPage(),
              transition: Transition.rightToLeft);
        },
        title: "تسجيل الخروج",
        message: "هل انت متاكد من تسجيل الخروج"));
  }

  Future<void> updateUser({required User user}) async {
    // showLoding();
    final response = await _updateUserUsecase(user: user);
    // Get.back();
    response.fold((failure) {
      handleError(failure);
    }, (r) async {
      handleSuccess();
      getUserInfo();
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));
      update();
    });
  }
}
