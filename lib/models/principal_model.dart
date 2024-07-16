import 'package:flutter/foundation.dart';

class PrincipalModel {
  final int userId;
  final String username;
  final String nickname;
  final String email;
  final int sex;
  final int age;
  final String profileImg;
  final List<String>
      authorities; // authorities는 SimpleGrantedAuthority의 role 문자열 목록으로 가정

  PrincipalModel({
    required this.userId,
    required this.username,
    required this.nickname,
    required this.email,
    required this.sex,
    required this.age,
    required this.profileImg,
    required this.authorities,
  });

  factory PrincipalModel.fromJson(Map<String, dynamic> json) {
    return PrincipalModel(
      userId: json['userId'] ?? 0,
      username: json['username'] ?? '',
      nickname: json['nickname'] ?? '',
      email: json['email'] ?? '',
      sex: json['sex'] ?? 0,
      age: json['age'] ?? 0,
      profileImg: json['profileImg'] ?? '',
      authorities: List<String>.from(json['authorities'] ?? [])
          .map((role) => role.toString())
          .toList(),
    );
  }
}
