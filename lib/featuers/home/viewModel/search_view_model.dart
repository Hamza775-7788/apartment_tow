import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/aprtment/model/aprtment_Model.dart';
import 'package:apartment_tow/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchViewModel {
  String title = "البحث".tr;
  String search = "ابحث عن شقة".tr;

  ApartmentControllerImpl _controllerImpl = Get.put(
    getIt!<ApartmentControllerImpl>(),
  );
  List<Apartment> get apartment {
    return _controllerImpl.searchApartment;
  }

  late TextEditingController controller;
  onChange(String qury) {
    _controllerImpl.search(qury: qury, coloumn: "title");
  }
}
