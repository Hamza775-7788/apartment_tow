import 'package:get/get.dart';
import 'package:apartment_tow/core/functions/handleMessage_function.dart.dart';
import 'package:apartment_tow/core/shared/cutsom_loding_dialog.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/foregetPassword/rest_password._use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/foregetPassword/send_code_use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/foregetPassword/verfiy_code_userCase.dart';
import 'package:apartment_tow/featuers/auth/presntaion/pages/FG_rest_password.dart';
import 'package:apartment_tow/featuers/auth/presntaion/pages/FG_verfiycode_view.dart';
import 'package:apartment_tow/featuers/home_view.dart';

abstract class ForegetPasswordController extends GetxController {
  Future<void> sendCode({required String email});
  Future<void> restPassword(
      {required String email, required String newPassword});
  Future<void> verfiyCode({required String code, required String email});
}

class ForegetPasswordControllerImp extends ForegetPasswordController {
  final AuthForgetPasswordRestPasswordUsecase _restPasswordUsecase;
  final AuthForgetPasswordSendCode _sendCode;
  final AuthForgetPasswordVerfiyCode _verfiyCode;

  ForegetPasswordControllerImp({
    required AuthForgetPasswordRestPasswordUsecase restPasswordUsecase,
    required AuthForgetPasswordSendCode sendCode,
    required AuthForgetPasswordVerfiyCode verfiyCode,
  })  : _restPasswordUsecase = restPasswordUsecase,
        _sendCode = sendCode,
        _verfiyCode = verfiyCode;

  @override
  Future<void> restPassword(
      {required String email, required String newPassword}) async {
    showLoding();
    final response =
        await _restPasswordUsecase(email: email, newPassword: newPassword);
    Get.back();
    response.fold((failure) {
      handleError(failure);
    }, (_) {
      Get.offAll(() => const MainViewPage(),
          transition: Transition.rightToLeft);
    });
  }

  @override
  Future<void> sendCode({required String email}) async {
    showLoding();
    final response = await _sendCode(email: email);
    Get.back();
    response.fold((failure) {
      handleError(failure);
    }, (_) {
      Get.off(() => FPverfiyCodeView(
            email: email,
          ));
    });
  }

  @override
  Future<void> verfiyCode({required String code, required String email}) async {
    showLoding();
    final response = await _verfiyCode(code: code, email: email);
    Get.back();
    response.fold((failure) {
      handleError(failure);
    }, (r) {
      Get.off(() => FGrestPasswordView(
            email: email,
          ));
    });
  }
}
