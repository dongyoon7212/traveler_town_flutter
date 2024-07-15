import 'package:flutter/material.dart';
import 'package:traveler_town/models/board_model.dart';
import 'package:traveler_town/widgets/home_board_slide.dart';

class BoardFutureBuilder extends StatelessWidget {
  const BoardFutureBuilder({
    super.key,
    required this.boardList,
  });

  final Future<List<BoardModel>> boardList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BoardModel>>(
      future: boardList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 250,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("데이터를 불러오는데 실패했습니다."),
          );
        } else if (snapshot.hasData) {
          return SizedBox(
            height: 250, // 적절한 높이 설정
            child: makeList(snapshot),
          );
        } else {
          return const Center(
            child: Text("데이터가 없습니다."),
          );
        }
      },
    );
  }
}
