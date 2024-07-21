import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        currentIndex: selectedIndex,
        onTap: onItemTapped,
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
    );
  }
}
