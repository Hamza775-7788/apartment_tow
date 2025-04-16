import 'package:get/get.dart';
import 'package:apartment_tow/core/functions/handleMessage_function.dart.dart';
import 'package:apartment_tow/core/shared/cutsom_loding_dialog.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/sign_up/send_code.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/sign_up/sign_up_use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/sign_up/verfiy_code_use_case.dart';
import 'package:apartment_tow/featuers/auth/presntaion/pages/verfiyCodeView.dart';
import 'package:apartment_tow/featuers/home_view.dart';

abstract class SignInAndSignUpController extends GetxController {
  Future<void> signin({required String email, required String passowrd});
  Future<void> signUp({required User user});
  Future<void> sendCode(
      {required String email, required String passowrd, required User user});
  Future<void> verifyCode(
      {required String code, required String email, required User user});

  Future<void> resendCode({
    required String email,
    required String passowrd,
  });
}

class SignInAndSignUpControllerImpl extends SignInAndSignUpController {
  final AuthSignInUseCase _authSignInUseCase;
  final AuthSignUpuseCase _signUpuseCase;
  final AuthSignUpSendCodeUsecase _sendCodeUsecase;
  final AuthSignUpSendVerfiyCodeUsecase _signUpSendVerfiyCodeUsecase;

  SignInAndSignUpControllerImpl({
    required AuthSignInUseCase authSignInUseCase,
    required AuthSignUpuseCase signUpuseCase,
    required AuthSignUpSendCodeUsecase sendCodeUsecase,
    required AuthSignUpSendVerfiyCodeUsecase signUpSendVerfiyCodeUsecase,
  })  : _authSignInUseCase = authSignInUseCase,
        _signUpuseCase = signUpuseCase,
        _sendCodeUsecase = sendCodeUsecase,
        _signUpSendVerfiyCodeUsecase = signUpSendVerfiyCodeUsecase;

  @override
  Future<void> sendCode(
      {required String email,
      required String passowrd,
      required User user}) async {
    showLoding();
    final response = await _sendCodeUsecase(email: email, passowrd: passowrd);
    Get.back();
    response.fold((failure) {
      handleError(failure);
    }, (_) {
      Get.off(
          () => VerfiyCodeView(
                password: passowrd,
                user: user,
                email: email,
              ),
          transition: Transition.leftToRight);
    });
  }

  @override
  Future<void> signUp({required User user}) async {
    final response = await _signUpuseCase(user: user);
    response.fold((failure) {
      handleError(failure);
    }, (_) {
      Get.offAll(() => const MainViewPage(),
          transition: Transition.rightToLeft);
    });
  }

  @override
  Future<void> signin({required String email, required String passowrd}) async {
    showLoding();

    final response = await _authSignInUseCase(email: email, password: passowrd);
    Get.back();
    response.fold((failure) {
      handleError(failure);
    }, (_) {
      Get.offAll(() => const MainViewPage(),
          transition: Transition.rightToLeft);
    });
  }

  @override
  Future<void> verifyCode(
      {required String code, required String email, required User user}) async {
    showLoding();
    final response =
        await _signUpSendVerfiyCodeUsecase(email: email, code: code);
    Get.back();
    response.fold((failure) {
      handleError(failure);
    }, (_) {
      signUp(user: user);
    });
  }

  @override
  Future<void> resendCode({
    required String email,
    required String passowrd,
  }) async {
    showLoding();
    final response = await _sendCodeUsecase(email: email, passowrd: passowrd);
    Get.back();
    response.fold((failure) {
      handleError(failure);
    }, (_) {
      handleSuccess();
    });
  }
}
