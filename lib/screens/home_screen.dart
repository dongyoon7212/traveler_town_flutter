import 'package:flutter/material.dart';
import 'package:traveler_town/models/board_model.dart';
import 'package:traveler_town/services/board_api_service.dart';
import 'package:traveler_town/widgets/banner_slide_widget.dart';
import 'package:traveler_town/widgets/future_board_slide.dart';
import 'package:traveler_town/widgets/home_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<BoardModel>> togetherBoardList =
      BoardApiService.getBoards(3);
  final Future<List<BoardModel>> travelBoardList = BoardApiService.getBoards(2);
  final Future<List<BoardModel>> restaurantBoardList =
      BoardApiService.getBoards(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const HomeAppBar(),
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromRGBO(22, 68, 113, 1),
        shape: const Border(
          bottom: BorderSide(
            width: 0.1,
          ),
        ),
      ),
      body: SingleChildScrollView(
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
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          fixedColor: const Color.fromRGBO(22, 68, 113, 1),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: "HOME",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                label: "CATEGORY"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "MYPAGE"),
          ],
        ),
      ),
    );
  }
}
