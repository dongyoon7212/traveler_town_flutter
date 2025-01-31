import 'package:flutter/material.dart';
import 'package:traveler_town/models/board_model.dart';

ListView makeList(AsyncSnapshot<List<BoardModel>> snapshot) {
  String getTimeDifference(String dateString) {
    final date = DateTime.parse(dateString);
    final now = DateTime.now();
    final differenceInMilliseconds = now.difference(date).inMilliseconds;
    final differenceInMinutes =
        (differenceInMilliseconds / (1000 * 60)).floor();

    if (differenceInMinutes < 1) {
      return "방금";
    } else if (differenceInMinutes < 60) {
      return "$differenceInMinutes분 전";
    } else if (differenceInMinutes < 1440) {
      final differenceInHours = (differenceInMinutes / 60).floor();
      return "$differenceInHours시간 전";
    } else {
      final differenceInDays = (differenceInMinutes / 1440).floor();
      return "$differenceInDays일 전";
    }
  }

  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    itemBuilder: (context, index) {
      var board = snapshot.data![index];
      return Container(
        width: 200, // 적절한 너비 설정
        height: 250,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: const Color(0xffdbdbdb),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: SizedBox(
                              width: 30,
                              child: Image.network(board.profileImg),
                            ),
                          ),
                        ),
                        Text(
                          board.nickname,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        getTimeDifference(board.createDate),
                        style: const TextStyle(
                          color: Color(0xff9a9a9a),
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Image.asset(
                  "assets/banner1.jpg",
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  board.boardTitle,
                  style: const TextStyle(
                    color: Color(0xff333333),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        board.boardCategoryId == 3
                            ? Text(board.sex == 1 ? "남자" : "여자")
                            : const Text(""),
                        board.boardCategoryId == 3
                            ? Text("∙${board.age}대")
                            : const Text(""),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xfff8f8f8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 6),
                        child: Text(
                          board.countryNameKor,
                          style: const TextStyle(
                            color: Color(0xff9a9a9a),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
    separatorBuilder: (context, index) => const SizedBox(width: 10),
  );
}
