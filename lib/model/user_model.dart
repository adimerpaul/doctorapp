class UserModel {
  final String userId;
  final String name;
  final String token;

  UserModel({required this.userId, required this.name, required this.token});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['user_id'],
      name: map['name'],
      token: map['token'],
    );
  }
}