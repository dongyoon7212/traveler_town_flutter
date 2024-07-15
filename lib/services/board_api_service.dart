import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:traveler_town/models/board_model.dart';

class BoardApiService {
  static const String baseUrl = "localhost:8080";

  static Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjEsInVzZXJuYW1lIjoiZG9uZ3lvb243MjEyIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJPTEVfVEVNUE9SQVJZX1VTRVIifSx7ImF1dGhvcml0eSI6IlJPTEVfVVNFUiJ9XSwiZXhwIjoxNzIyNzQzOTkzfQ.lru5sqEP0SqgwuMbGTJl7JhmQOA7x2oKGyfS-L23vKQ'
  };
  static const String getBoardAll = "/board/all";

  static Future<List<BoardModel>> getBoards(boardCategoryId) async {
    List<BoardModel> boardInstances = [];
    final queryParameters = {
      'boardCategoryId': boardCategoryId.toString(),
    };
    final url = Uri.http(baseUrl, getBoardAll, queryParameters);
    final response = await http.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      final List<dynamic> boards = jsonDecode(utf8.decode(response.bodyBytes));
      for (var board in boards) {
        boardInstances.add(BoardModel.fromJson(board));
      }
      return boardInstances;
    }
    throw Exception('Failed to load boards');
  }
}
