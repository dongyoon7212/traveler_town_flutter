import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:traveler_town/models/board_model.dart';
import 'package:traveler_town/services/auth_api_service.dart';

class BoardApiService {
  static const String baseUrl =
      "ec2-3-36-22-124.ap-northeast-2.compute.amazonaws.com:8080";

  static Future<Map<String, String>> get requestHeaders async {
    final headers = await AuthApiService.getHeaders();
    return headers;
  }

  static const String getBoardAll = "/board/all";

  static Future<List<BoardModel>> getSortedBoardsByBoardCategoryId(
      boardCategoryId) async {
    List<BoardModel> boardInstances = [];
    final queryParameters = {
      'boardCategoryId': boardCategoryId.toString(),
    };
    final url = Uri.http(baseUrl, getBoardAll, queryParameters);

    final headers = await requestHeaders;
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> boards = jsonDecode(utf8.decode(response.bodyBytes));
      for (var board in boards) {
        boardInstances.add(BoardModel.fromJson(board));
      }
      boardInstances.sort((a, b) => b.createDate.compareTo(a.createDate));
      return boardInstances.take(6).toList();
    } else {
      throw Exception('Failed to load boards');
    }
  }
}
