import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:traveler_town/models/principal_model.dart';

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
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<PrincipalModel> getPrincipal() async {
    final headers = await getHeaders();
    final response = await http.get(
      Uri.parse('http://localhost:8080/account/principal'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final utf8DecodedBody = utf8.decode(response.bodyBytes);
      final principal = PrincipalModel.fromJson(jsonDecode(utf8DecodedBody));
      return principal;
    } else {
      throw Exception('Failed to get principal: ${response.reasonPhrase}');
    }
  }

  static editSex(int sex) async {
    final headers = await getHeaders();
    final response = await http.put(
        Uri.parse("http://localhost:8080/account/sex"),
        body: jsonEncode(<String, int>{"sex": sex}),
        headers: headers);

    return response.body;
  }

  static editAge(int age) async {
    final headers = await getHeaders();
    final response = await http.put(
        Uri.parse("http://localhost:8080/account/age"),
        body: jsonEncode(<String, int>{"age": age}),
        headers: headers);

    return response.body;
  }
}
