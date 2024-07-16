import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthApiService {
  static Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  final storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await storage.write(key: 'AccessToken', value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'AccessToken');
  }

  static Future<String> signin(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/auth/signin'),
      headers: requestHeaders,
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      // 로그인 성공 시, 토큰을 반환
      print(response.body);
      return (response.body);
    } else {
      // 로그인 실패 시, 예외를 던짐
      throw Exception('Failed to login');
    }
  }
}
