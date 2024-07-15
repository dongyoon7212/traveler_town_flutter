class BoardModel {
  final int userId;
  final String nickname;
  final String email;
  final int sex;
  final int age;
  final String profileImg;
  final int boardId;
  final int boardCategoryId;
  final String countryCode;
  final String countryNameKor;
  final String boardTitle;
  final String boardContent;
  final String createDate;
  final String updateDate;
  final int boardBookmarkCount;
  final int boardLikeCount;
  final int boardCommentCount;

  BoardModel.fromJson(Map<dynamic, dynamic> json)
      : userId = json["userId"],
        nickname = json["nickname"],
        email = json["email"],
        sex = json["sex"],
        age = json["age"],
        profileImg = json["profileImg"],
        boardId = json["boardId"],
        boardCategoryId = json["boardCategoryId"],
        countryCode = json["countryCode"],
        countryNameKor = json["countryNameKor"],
        boardTitle = json["boardTitle"],
        boardContent = json["boardContent"],
        createDate = json["createDate"],
        updateDate = json["updateDate"],
        boardBookmarkCount = json["boardBookmarkCount"],
        boardLikeCount = json["boardLikeCount"],
        boardCommentCount = json["boardCommentCount"];
}
