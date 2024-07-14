import 'package:flutter/material.dart';
import 'package:traveler_town/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const HomeAppBar(),
        backgroundColor: Colors.white,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
