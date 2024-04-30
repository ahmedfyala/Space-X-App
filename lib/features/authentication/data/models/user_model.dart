class UserModel {
  final String name;
  final String email;
  final String uId;

  UserModel({
    required this.name,
    required this.email,
    required this.uId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      uId: map['uId'] ?? '',
    );
  }
}
