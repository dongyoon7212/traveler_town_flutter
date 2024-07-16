import 'package:flutter/material.dart';
import 'package:traveler_town/models/board_model.dart';
import 'package:traveler_town/services/board_api_service.dart';
import 'package:traveler_town/widgets/banner_slide_widget.dart';
import 'package:traveler_town/widgets/future_board_slide.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  final Future<List<BoardModel>> togetherBoardList =
      BoardApiService.getSortedBoardsByBoardCategoryId(3);
  final Future<List<BoardModel>> travelBoardList =
      BoardApiService.getSortedBoardsByBoardCategoryId(2);
  final Future<List<BoardModel>> restaurantBoardList =
      BoardApiService.getSortedBoardsByBoardCategoryId(1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ImageCarousel(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "최신 동행 포스트",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  BoardFutureBuilder(boardList: togetherBoardList),
                  const Text(
                    "최신 여행지 포스트",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  BoardFutureBuilder(boardList: travelBoardList),
                  const Text(
                    "최신 맛집 포스트",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  BoardFutureBuilder(boardList: restaurantBoardList),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
