import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/aprtment/view/screen/add_order_view.dart';
import 'package:apartment_tow/main.dart';
import 'package:get/get.dart';

class ApartmentDitalesViewMode {
  String title = "تفاصيل الشقة".tr;
  String deleteLable = "حذف".tr;
  String sendRequst = "طلب تأجير".tr;
  ApartmentControllerImpl _controllerImpl = Get.put(
    getIt!<ApartmentControllerImpl>(),
  );
  onDelete(int id) {
    _controllerImpl.deleteApartment(id: id.toString());
  }

  onSendRequst(int id) {
    Get.to(() => AddOrderPage(apartmentID: id));
  }
}
