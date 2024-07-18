import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:traveler_town/models/country_model.dart';
import 'package:http/http.dart' as http;

class CountryApiService {
  static const _storage = FlutterSecureStorage();

  static Future<String?> getToken() async {
    return await _storage.read(key: 'AccessToken');
  }

  static Future<Map<String, String>> getHeaders() async {
    final token = await getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<List<CountryModel>> getCountryAll() async {
    List<CountryModel> countryList = [];
    final headers = await getHeaders();
    final response = await http.get(
      Uri.parse("http://localhost:8080/country/all"),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> countries =
          jsonDecode(utf8.decode(response.bodyBytes));
      for (var country in countries) {
        countryList.add(CountryModel.fromJson(country));
      }
      return countryList;
    } else {
      throw Exception('Failed to load boards');
    }
  }
}
