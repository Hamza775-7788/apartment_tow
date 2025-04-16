import 'package:apartment_tow/core/local_api/local_data_source.dart';
import 'package:apartment_tow/core/localization/local_controller.dart';
import 'package:apartment_tow/core/network/network.dart';
import 'package:apartment_tow/core/upload_packge/upload_File.dart';
import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/aprtment/repo/apartment_repo.dart';
import 'package:apartment_tow/featuers/auth/data/data_source/remote_data_source.dart';
import 'package:apartment_tow/featuers/auth/data/repository/auth_repostiory_impl.dart';
import 'package:apartment_tow/featuers/auth/domain/repository/auth_respository.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/foregetPassword/rest_password._use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/foregetPassword/send_code_use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/foregetPassword/verfiy_code_userCase.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/sign_up/send_code.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/sign_up/sign_up_use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/sign_up/verfiy_code_use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/user/delete_use_profile_use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/user/get_use_info_use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/user/set_profile_use_case.dart';
import 'package:apartment_tow/featuers/auth/domain/use_cases/user/update_user_use_case.dart';
import 'package:apartment_tow/featuers/auth/presntaion/controller/Auth_controller.dart';
import 'package:apartment_tow/featuers/auth/presntaion/controller/forgetPassword_controller.dart';
import 'package:apartment_tow/featuers/auth/presntaion/controller/splash_controller.dart';
import 'package:apartment_tow/featuers/profile/presntaion/controller/profileController.dart';
import 'package:apartment_tow/featuers/profile/presntaion/controller/settingController.dart';
import 'package:apartment_tow/featuers/shared/repo/shared_repository.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // ========================================
  //  ========= Auth ========================
  // ========================================

  // controller

  sl.registerFactory<SignInAndSignUpControllerImpl>(
    () => SignInAndSignUpControllerImpl(
      authSignInUseCase: sl(),
      signUpuseCase: sl(),
      sendCodeUsecase: sl(),
      signUpSendVerfiyCodeUsecase: sl(),
    ),
  );
  sl.registerFactory<ForegetPasswordControllerImp>(
    () => ForegetPasswordControllerImp(
      restPasswordUsecase: sl(),
      sendCode: sl(),
      verfiyCode: sl(),
    ),
  );
  sl.registerFactory<SplashControllerImpl>(
    () => SplashControllerImpl(getUserInfoUsecase: sl()),
  );

  sl.registerFactory<SettingControllerImpl>(
    () => SettingControllerImpl(
      updateUserUsecase: sl(),
      localDataSource: sl(),
      getUserInfoUsecase: sl(),
    ),
  );
  sl.registerFactory<PrfileControllerImpl>(
    () => PrfileControllerImpl(
      getUserInfoUsecase: sl(),
      localDataSource: sl(),
      updateUserUsecase: sl(),
      imagePicker: sl(),
    ),
  );
  // user Cases

  sl.registerLazySingleton(() => AuthDeleteUsePrfileUsecase(sl()));
  sl.registerLazySingleton(() => AuthForgetPasswordRestPasswordUsecase(sl()));
  sl.registerLazySingleton(() => AuthForgetPasswordSendCode(sl()));
  sl.registerLazySingleton(() => AuthForgetPasswordVerfiyCode(sl()));
  sl.registerLazySingleton(() => AuthSignInUseCase(sl()));
  sl.registerLazySingleton(() => AuthSignUpSendCodeUsecase(sl()));
  sl.registerLazySingleton(() => AuthSignUpSendVerfiyCodeUsecase(sl()));
  sl.registerLazySingleton(() => AuthSignUpuseCase(sl()));
  sl.registerLazySingleton(() => AuthUpdateUserUsecase(sl()));
  sl.registerLazySingleton(() => AuthGetUserInfoUsecase(sl()));
  sl.registerLazySingleton(() => AuthSetProfileUsecase(sl()));

  // Repository

  sl.registerLazySingleton<AuthRepository>(
    () => AuthReositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // data sourse

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  // controller

  sl.registerFactory<ApartmentControllerImpl>(
    () => ApartmentControllerImpl(
      apartmentRepoistory: sl(),
      imagePicker: sl(),
      sharedRepository: sl(),
    ),
  );

  sl.registerLazySingleton<ApartmentRepoistory>(
    () => ApartmentRepoistoryImpl(
      getConnect: sl(),
      networkInfo: sl(),
      uploaidFiles: sl(),
      localDataSource: sl(),
    ),
  );
  sl.registerFactory<SharedRepository>(
    () => SharedRepositoryImpl(getConnect: sl(), networkInfo: sl()),
  );
  // ================================================================
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<LocalContollerImplment>(
    () => LocalContollerImplment(sharedPreferences: sl()),
  );
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<UploaidFiles>(() => UploaidFilesImpl());
  sl.registerLazySingleton(() => GetConnect());
  sl.registerLazySingleton(() => ImagePicker());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
