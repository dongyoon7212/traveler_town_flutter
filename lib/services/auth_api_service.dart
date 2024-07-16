import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthApiService {
  static const _storage = FlutterSecureStorage();

  static const Map<String, String> _baseHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'AccessToken', value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'AccessToken');
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: 'AccessToken');
  }

  static Future<Map<String, String>> _getHeaders() async {
    final token = await getToken();
    return {
      ..._baseHeaders,
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<String> signin(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/auth/signin'),
      headers: _baseHeaders,
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final token = response.body;
      await saveToken(token);
      return token;
    } else {
      throw Exception('Failed to login: ${response.reasonPhrase}');
    }
  }

  static Future<Map<String, String>> getHeaders() async {
    final token = await getToken();
    return {
      ..._baseHeaders,
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }
}
