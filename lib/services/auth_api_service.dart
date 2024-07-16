import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthApiService {
  static Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<String> signin(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://localhost:8080/auth/signin'),
      headers: requestHeaders,
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      // 로그인 성공 시, 토큰을 반환
      return jsonDecode(response.body)['AccessToken'];
    } else {
      // 로그인 실패 시, 예외를 던짐
      throw Exception('Failed to login');
    }
  }
}
