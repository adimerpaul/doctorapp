import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserModel {
  final String userId;
  final String name;
  final String token;
  final String? email;
  final String? avatar;
  final String? role;

  UserModel({
    required this.userId,
    required this.name,
    required this.token,
    this.email,
    this.avatar,
    this.role,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['user_id'],
      name: map['name'],
      token: map['token'],
      email: map['email'],
      avatar: map['avatar'],
      role: map['role'],
    );
  }

  /// URL completo del avatar desde IMG_BASE_URL + avatar
  String get avatarUrl {
    if (avatar == null || avatar!.isEmpty) return '';
    final baseUrl = dotenv.env['IMG_BASE_URL'] ?? '';
    return '$baseUrl/$avatar';
  }
}
