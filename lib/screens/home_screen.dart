import 'package:flutter/material.dart';
import 'package:traveler_town/screens/mypage_screen.dart';
import 'package:traveler_town/screens/signin_screen.dart';
import 'package:traveler_town/services/auth_api_service.dart';
import 'package:traveler_town/widgets/home_app_bar_widget.dart';
import 'package:traveler_town/widgets/home_body_widget.dart';
import 'package:traveler_town/screens/restaurant_screen.dart';
import 'package:traveler_town/screens/together_screen.dart';
import 'package:traveler_town/screens/travel_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _widgetOption = <Widget>[
    HomeBody(),
    const Together(),
    const Travel(),
    const Restaurant(),
    const Mypage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    if (index == 4) {
      // "마이페이지" 아이템이 선택된 경우
      try {
        // 사용자 정보 가져오기 시도
        await AuthApiService.getPrincipal();
        // 사용자 정보가 있으면 마이페이지로 이동
        setState(() {
          _selectedIndex = index;
        });
      } catch (e) {
        // 사용자 정보가 없으면(인증되지 않음) SigninScreen으로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignIn()),
        );
      }
    } else {
      // 다른 아이템이 선택된 경우 그냥 해당 화면으로 이동
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const HomeAppBar(),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        foregroundColor: const Color.fromRGBO(22, 68, 113, 1),
        shape: const Border(
          bottom: BorderSide(
            width: 0.1,
          ),
        ),
      ),
      body: SafeArea(
        child: _widgetOption.elementAt(_selectedIndex),
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
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          fixedColor: const Color.fromRGBO(22, 68, 113, 1),
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          currentIndex: _selectedIndex, // 지정 인덱스로 이동
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: "홈",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                ),
                label: "동행"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.wallet_travel,
                ),
                label: "여행지"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.restaurant,
                ),
                label: "맛집"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "마이페이지"),
          ],
        ),
      ),
    );
  }
}
