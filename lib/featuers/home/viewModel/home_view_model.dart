import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/aprtment/model/aprtment_Model.dart';
import 'package:apartment_tow/featuers/shared/model/ItemModel.dart';
import 'package:apartment_tow/main.dart';
import 'package:get/get.dart';

class HomeViewModel {
  String title = "الصفحه الرئيسية".tr;

  HomeViewModel() {
    getData();
  }

  int type = 0;
  getData() async {
    await _controllerImpl.getApratmentType();
    type =
        _controllerImpl.apartmentType.isNotEmpty
            ? _controllerImpl.apartmentType.first.id
            : 0;
    await _controllerImpl.getApartmentById(id: type);
  }

  List<Apartment> get apartment {
    return _controllerImpl.apartment;
  }

  onChange(int id) {
    type = id;
    _controllerImpl.getApartmentById(id: id);
  }

  List<EilmentModel> get typsList {
    return _controllerImpl.apartmentType;
  }

  ApartmentControllerImpl _controllerImpl = Get.put(
    getIt!<ApartmentControllerImpl>(),
  );
}
