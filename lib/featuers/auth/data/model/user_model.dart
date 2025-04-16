import 'package:apartment_tow/core/SERVER/root_link_api.dart';
import 'package:apartment_tow/featuers/auth/domain/entity/user_entity.dart';


class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.type,
    required super.email,
    super.phone,
    super.profile,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
        email: json['email'],
        phone: json['phone'],
        profile: json['profile'] == null ? null : "$uploid/${json['profile']}",
        id: json['id'],
        name: json['name'],
        type: json['type']);
  }

  toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "profile": profile,
      "email": email,
      "type": type,
    };
  }
}
