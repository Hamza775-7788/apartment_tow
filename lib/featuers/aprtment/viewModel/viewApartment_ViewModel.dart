import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/aprtment/model/aprtment_Model.dart';
import 'package:apartment_tow/featuers/aprtment/view/screen/add_apartment_page.dart';
import 'package:apartment_tow/main.dart';
import 'package:get/get.dart';

class ApartmentApdminViewModel {
  String title = "شقق".tr;

  ApartmentApdminViewModel() {
    _controllerImpl.getApartMent(forUser: false);
  }

  ApartmentControllerImpl _controllerImpl = Get.put(
    getIt!<ApartmentControllerImpl>(),
  );

  List<Apartment> get apartmentList {
    return _controllerImpl.apartment;
  }

  onAdd() {
    Get.to(() => AddApartmentPage());
  }
}
