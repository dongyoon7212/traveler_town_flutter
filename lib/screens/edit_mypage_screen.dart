import 'package:flutter/material.dart';

class EditMypageScreen extends StatefulWidget {
  const EditMypageScreen({super.key});

  @override
  State<EditMypageScreen> createState() => _EditMypageScreenState();
}

class _EditMypageScreenState extends State<EditMypageScreen> {
  int _sex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Hero(
          tag: "menu_title",
          child: Text(
            "내 정보 수정",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 50,
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "성별",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              RadioListTile(
                title: const Text("남자"),
                value: 1,
                groupValue: _sex,
                onChanged: (int? value) {
                  setState(() {
                    _sex = value!;
                    print("남자");
                  });
                },
              ),
              RadioListTile(
                title: const Text("여자"),
                value: 2,
                groupValue: _sex,
                onChanged: (int? value) {
                  setState(() {
                    _sex = value!;
                    print("여자");
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "나이",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
