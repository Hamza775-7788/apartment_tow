class User {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? profile;
  final int type;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.profile,
    required this.type,
  });
}
