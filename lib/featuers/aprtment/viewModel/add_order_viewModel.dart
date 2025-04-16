import 'package:apartment_tow/core/shared/dialgos_widgets.dart';
import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/shared/model/ItemModel.dart';
import 'package:apartment_tow/main.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddOrderViewModel {
  final int aprtmentID;

  ApartmentControllerImpl _controllerImpl = Get.put(
    getIt!<ApartmentControllerImpl>(),
  );
  AddOrderViewModel({required this.aprtmentID}) {
    _controllerImpl.getGusType();
    _controllerImpl.getJopsType();
  }
  String title = "طلب تأجير".tr;
  String nameLable = "الاسم الرباعي".tr;
  String phoneLable = "رقم الهاتف".tr;
  String childrenLable = "عدد الاطفال".tr;
  String jopLable = "ماهو عملك".tr;
  String guaranteesLable = "الضمانه".tr;
  String addLable = "ارسال".tr;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController childrenController;
  int typeID = 0;
  int guaranteesID = 0;
  List<EilmentModel> get jops {
    return _controllerImpl.jopTypes;
  }

  List<EilmentModel> get guarantees {
    return _controllerImpl.guaranteesType;
  }

  onChanageOne(int id) {
    typeID = id;
  }

  onChangeTow(int id) {
    guaranteesID = id;
  }

  onAdd() {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        childrenController.text.isEmpty ||
        typeID == 0 ||
        guaranteesID == 0) {
      Get.dialog(ErorrDilaog(message: "يجب ملء جميع الحقول".tr));
    } else {
      _controllerImpl.addRequst(
        apartmentID: aprtmentID,
        name: nameController.text,
        phone: phoneController.text,
        children: int.parse(childrenController.text),
        jopID: typeID,
        guaranteesID: guaranteesID,
      );
    }
  }
}
