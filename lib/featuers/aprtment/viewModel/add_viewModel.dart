import 'dart:io';

import 'package:apartment_tow/core/shared/cutsom_loding_dialog.dart';
import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/aprtment/model/aprtment_Model.dart';
import 'package:apartment_tow/featuers/shared/model/ItemModel.dart';
import 'package:apartment_tow/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddApartmentViewModel {
  String title = "اضافة شقه".tr;
  AddApartmentViewModel() {
    _controllerImpl.getApratmentType();
  }

  ApartmentControllerImpl _controllerImpl = Get.put(
    getIt!<ApartmentControllerImpl>(),
  );

  String selectImageLable = "اختر صورة".tr;
  onSelectImage() {
    _controllerImpl.selectImages();
  }

  List<File> get images => _controllerImpl.images;
  List<EilmentModel> get apartmentType => _controllerImpl.apartmentType;
  String tatileLable = "عنوان العرض".tr;
  String governorateLable = "المحافظة".tr;
  String cityLable = "المدينة".tr;
  String streetLable = "الشارع".tr;
  String priceLable = "السعر".tr;
  String longDescriptionLable = "الوصف الطويل".tr;
  String shortDescriptionLable = "الوصف القصير".tr;
  String featuresLable = "المميزات".tr;
  String apartmentTypeNameHint = "نوع الشقة".tr;
  String addButtonLabel = "اضافة شقة";
  late TextEditingController titleController;
  late TextEditingController governorateController;
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController priceController;
  late TextEditingController longDescriptionController;
  late TextEditingController shortDescriptionController;
  late TextEditingController featuresController;
  late TextEditingController apartmentTypeNameController;

  onAdd() async {
    if (titleController.text.isEmpty) {
      Get.snackbar(
        "خطأ",
        "يرجى إدخال عنوان العرض",
        backgroundColor: Colors.red.withAlpha(50),
      );
    } else if (governorateController.text.isEmpty) {
      Get.snackbar(
        "خطأ".tr,
        "يرجى إدخال المحافظة".tr,
        backgroundColor: Colors.red.withAlpha(50),
      );
    } else if (cityController.text.isEmpty) {
      Get.snackbar(
        "خطأ".tr,
        "يرجى إدخال المدينة".tr,
        backgroundColor: Colors.red.withAlpha(50),
      );
    } else if (streetController.text.isEmpty) {
      Get.snackbar(
        "خطأ".tr,
        "يرجى إدخال الشارع".tr,
        backgroundColor: Colors.red.withAlpha(50),
      );
    } else if (priceController.text.isEmpty) {
      Get.snackbar(
        "خطأ".tr,
        "يرجى إدخال السعر".tr,
        backgroundColor: Colors.red.withAlpha(50),
      );
    } else if (longDescriptionController.text.isEmpty) {
      Get.snackbar(
        "خطأ".tr,
        "يرجى إدخال الوصف الطويل".tr,
        backgroundColor: Colors.red.withAlpha(50),
      );
    } else if (shortDescriptionController.text.isEmpty) {
      Get.snackbar(
        "خطأ".tr,
        "يرجى إدخال الوصف القصير".tr,
        backgroundColor: Colors.red.withAlpha(50),
      );
    } else if (featuresController.text.isEmpty) {
      Get.snackbar(
        "خطأ".tr,
        "يرجى إدخال المميزات".tr,
        backgroundColor: Colors.red.withAlpha(50),
      );
    } else {
      List<String> imagesUrl = [];
      showLoding();
      for (var image in images) {
        await _controllerImpl.uploadImageApartment(
          onFailed: (f) {},
          onSuccess: (s) {
            imagesUrl.add(s);
          },
          image: image,
        );
      }
      Get.back();
      Apartment apartment = Apartment(
        apartmentTitle: titleController.text,
        governorate: governorateController.text,
        city: cityController.text,
        street: streetController.text,
        price: double.parse(priceController.text),
        longDescription: longDescriptionController.text,
        shortDescription: shortDescriptionController.text,
        features: featuresController.text,
        apartmentTypeNameAr: apartmentTypeId.toString(),
        images: imagesUrl,
        apartmentId: 0,
        rating: '0',
        createdAt: DateTime.now(),
        status: 0,
        apartmentTypeNameEn: '',
        userName: '',
        userEmail: '',
      );

      await _controllerImpl.addApartment(apartment: apartment);
    }
  }

  int apartmentTypeId = 0;
  Future<void> uploadImages() async {}
}
