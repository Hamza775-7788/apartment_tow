import 'dart:io';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/core/functions/handleMessage_function.dart.dart';
import 'package:apartment_tow/core/shared/cutsom_loding_dialog.dart';
import 'package:apartment_tow/core/shared/dialgos_widgets.dart';
import 'package:apartment_tow/featuers/shared/model/ItemModel.dart';
import 'package:apartment_tow/featuers/shared/repo/shared_repository.dart';
import "package:image_picker/image_picker.dart";
import 'package:apartment_tow/featuers/aprtment/model/aprtment_Model.dart';
import 'package:apartment_tow/featuers/aprtment/repo/apartment_repo.dart';
import 'package:get/get.dart';

abstract class ApartmentController extends GetxController {
  Future<void> getApartMent({bool forUser = true, int? id});
  Future<void> addApartment({required Apartment apartment});
  Future<void> uploadImageApartment({
    required File image,
    required Function(Failure falure) onFailed,
    required Function(String url) onSuccess,
  });
  Future<void> deleteApartment({required String id});
  Future<void> updateApartment({required Apartment apartment});
  Future<void> search({required String qury, required String coloumn});
  Future<void> getApartmentById({required int id});
  Future<void> selectImages();
  Future<void> getApratmentType();
  Future<void> getJopsType();
  Future<void> getGusType();
  Future<void> addRequst({
    required int apartmentID,
    required String name,
    required String phone,
    required int children,
    required int jopID,
    required int guaranteesID,
  });
}

class ApartmentControllerImpl extends ApartmentController {
  final ApartmentRepoistory _apartmentRepoistory;
  final SharedRepository _sharedRepository;
  final ImagePicker _imagePicker;
  List<Apartment> apartment = [];
  List<EilmentModel> apartmentType = [];
  List<EilmentModel> jopTypes = [];
  List<EilmentModel> guaranteesType = [];
  Apartment? singlApartMent;
  List<File> images = [];

  ApartmentControllerImpl({
    required ApartmentRepoistory apartmentRepoistory,
    required SharedRepository sharedRepository,
    required ImagePicker imagePicker,
  }) : _apartmentRepoistory = apartmentRepoistory,
       _sharedRepository = sharedRepository,
       _imagePicker = imagePicker;

  @override
  Future<void> addApartment({required Apartment apartment}) async {
    try {
      showLoding();
      final response = await _apartmentRepoistory.addApartment(
        apartment: apartment,
      );
      Get.back();
      response.fold(
        (falure) {
          handleError(falure);
        },
        (_) {
          handleSuccess();
          getApartMent(forUser: false);
          Get.back();
        },
      );
    } catch (e) {
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> deleteApartment({required String id}) async {
    try {
      showLoding();
      final response = await _apartmentRepoistory.deleteApartment(id: id);
      Get.back();
      response.fold(
        (falure) {
          handleError(falure);
        },
        (_) {
          handleSuccess();
          getApartMent(forUser: false);
          Get.back();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> getApartMent({bool forUser = true, int? id}) async {
    try {
      final response = await _apartmentRepoistory.getApartMent(
        forUser: forUser,
      );

      response.fold(
        (falure) {
          if (falure is EmptyRemotDataFailure) {
            apartment = [];
            update();
          }
          handleError(falure);
        },
        (r) {
          apartment = r;
          update();
        },
      );
    } catch (e) {
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> getApartmentById({required int id}) async {
    try {
      final response = await _apartmentRepoistory.getApartMentByType(
        typeID: id,
      );

      response.fold(
        (falure) {
          if (falure is EmptyRemotDataFailure) {
            apartment = [];
            update();
          }
        },
        (r) {
          apartment = r;
          update();
        },
      );
    } catch (e) {
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> search({required String qury, required String coloumn}) async {
    try {
      final response = await _apartmentRepoistory.search(
        qury: qury,
        coloumn: coloumn,
      );
      response.fold((falure) {}, (r) {
        apartment = r;
        update();
      });
    } catch (e) {}
  }

  @override
  Future<void> updateApartment({required Apartment apartment}) async {
    try {
      showLoding();
      final response = await _apartmentRepoistory.updateApartment(
        apartment: apartment,
      );
      Get.back();

      response.fold(
        (falure) {
          handleError(falure);
        },
        (_) {
          handleSuccess();
          getApartMent(forUser: false);
          Get.back();
        },
      );
    } catch (e) {
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> uploadImageApartment({
    required File image,
    required Function(Failure falure) onFailed,
    required Function(String url) onSuccess,
  }) async {
    try {
      final response = await _apartmentRepoistory.uploadImageApartment(
        image: image,
      );
      response.fold(
        (falure) {
          onFailed(falure);
        },
        (r) {
          onSuccess(r);
        },
      );
    } catch (e) {
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> selectImages() async {
    List<XFile> _image = await _imagePicker.pickMultiImage();
    for (var i in _image) {
      images.add(File(i.path));
    }
    update();
  }

  @override
  Future<void> getApratmentType() async {
    try {
      final response = await _sharedRepository.getApratmentType();

      response.fold(
        (falure) {
          handleError(falure);
        },
        (r) {
          apartmentType = r;
          update();
        },
      );
    } catch (e) {
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> addRequst({
    required int apartmentID,
    required String name,
    required String phone,
    required int children,
    required int jopID,
    required int guaranteesID,
  }) async {
    try {
      showLoding();
      final response = await _apartmentRepoistory.addRequst(
        apartmentID: apartmentID,
        name: name,
        phone: phone,
        children: children,
        jopID: jopID,
        guaranteesID: guaranteesID,
      );
      Get.back();

      response.fold(
        (falure) {
          handleError(falure);
        },
        (_) {
          handleSuccess();
          Get.back();
        },
      );
    } catch (e) {
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> getGusType() async {
    try {
      final response = await _sharedRepository.getGuarantees();

      response.fold(
        (falure) {
          handleError(falure);
        },
        (r) {
          guaranteesType = r;
          update();
        },
      );
    } catch (e) {
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> getJopsType() async {
    try {
      final response = await _sharedRepository.getJop();

      response.fold(
        (falure) {
          handleError(falure);
        },
        (r) {
          jopTypes = r;
          update();
        },
      );
    } catch (e) {
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }
}
