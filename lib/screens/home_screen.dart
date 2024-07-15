import 'package:flutter/material.dart';
import 'package:traveler_town/widgets/banner_slide_widget.dart';
import 'package:traveler_town/widgets/home_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageCarousel(),
        ],
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
