class PrincipalModel {
  final int userId;
  final String username;
  final String nickname;
  final String email;
  final int sex;
  final int age;
  final String profileImg;
  final List<String> authorities;

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
      userId: json['userId'],
      username: json['username'],
      nickname: json['nickname'],
      email: json['email'],
      sex: json['sex'],
      age: json['age'],
      profileImg: json['profileImg'],
      authorities: List<String>.from(
          json['authorities'].map((auth) => auth['authority'])),
    );
  }
}
