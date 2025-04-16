import 'package:apartment_tow/core/model/category_or_unit_entiry.dart';

class CategoryOrUnitModel extends CategoryOrUnit {
  CategoryOrUnitModel({required super.id, required super.name});

  factory CategoryOrUnitModel.fromJson(json) {
    return CategoryOrUnitModel(id: json['id'], name: json['name']);
  }

  Map toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
