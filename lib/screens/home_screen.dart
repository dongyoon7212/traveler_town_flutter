import 'package:flutter/material.dart';
import 'dart:async';

final List<String> imgList = [
  "assets/banner1.jpg",
  "assets/banner2.jpeg",
  "assets/banner3.jpeg",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < imgList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              stretch: true,
              backgroundColor: const Color.fromRGBO(22, 68, 113, 1),
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 2,
                title: const Text(
                  "Traveler Town",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                background: PageView.builder(
                  controller: _pageController,
                  itemCount: imgList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      imgList[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("Item $index", textAlign: TextAlign.center),
            );
          },
        ),
      ),
    );
  }
}

// void main() => runApp(const MaterialApp(home: HomeScreen()));
