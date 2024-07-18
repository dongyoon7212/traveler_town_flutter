import 'package:flutter/material.dart';
import 'package:traveler_town/models/principal_model.dart';
import 'package:traveler_town/screens/edit_mypage_screen.dart';
import 'package:traveler_town/screens/home_screen.dart';
import 'package:traveler_town/services/auth_api_service.dart';

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      AuthApiService.deleteToken();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    }

    return FutureBuilder<PrincipalModel>(
      future: AuthApiService.getPrincipal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
            ),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text(
              'No Data',
            ),
          );
        } else {
          PrincipalModel principalModel = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffdbdbdb),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.network(
                      principalModel.profileImg,
                    ),
                  ),
                ),
                _gap(0, 16),
                Text(
                  principalModel.nickname,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      principalModel.email,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    _gap(10, 10),
                    const Icon(
                      Icons.check_circle,
                      size: 20,
                      color: Color.fromRGBO(0, 128, 0, 1),
                    )
                  ],
                ),
                _gap(0, 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "성별 : ${principalModel.sex == 1 ? "남" : "여"}",
                    ),
                    _gap(50, 0),
                    Text("나이 : ${principalModel.age}대")
                  ],
                ),
                _gap(0, 50),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.5, color: Color(0xffdbdbdb)),
                    ),
                  ),
                  child: Column(
                    children: [
                      mypageMenuBar(
                        const Icon(Icons.edit),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditMypageScreen(),
                            ),
                          );
                        },
                        const Text(
                          "내 정보 수정",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      mypageMenuBar(
                          const Icon(Icons.logout),
                          logout,
                          const Text(
                            "로그아웃",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }

  Row mypageMenuBar(Icon icon, VoidCallback onTap, Widget titleWidget) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListTile(
            minVerticalPadding: 15,
            onTap: onTap,
            shape: const Border(
              bottom: BorderSide(
                width: 1,
                color: Color(0xffdbdbdb),
              ),
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon,
                    _gap(7, 0),
                    titleWidget,
                  ],
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _gap(double width, double height) => SizedBox(
        width: width,
        height: height,
      );
}
