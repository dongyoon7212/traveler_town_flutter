class SimpleGrantedAuthorityModel {
  final String role;

  SimpleGrantedAuthorityModel(
    this.role,
  );

  SimpleGrantedAuthorityModel.fromJson(Map<String, dynamic> json)
      : role = json["role"];
}
