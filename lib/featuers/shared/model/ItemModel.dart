import 'package:get/get.dart';

class EilmentModel {
  final int id;
  final String nameAr;
  final String nameEn;

  EilmentModel({required this.id, required this.nameAr, required this.nameEn});

  factory EilmentModel.fromJson(Map<String, dynamic> json) {
    return EilmentModel(
      id: json['id'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nameAr": nameAr, "nameEn": nameEn};
  }

  get name {
    return Get.locale?.languageCode == "ar" ? nameAr : nameEn;
  }
}
