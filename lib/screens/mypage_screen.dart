import 'package:flutter/material.dart';
import 'package:traveler_town/models/principal_model.dart';
import 'package:traveler_town/services/auth_api_service.dart';

class Mypage extends StatefulWidget {
  const Mypage({
    super.key,
  });

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  late final PrincipalModel principalModel;

  @override
  void initState() async {
    super.initState();
    principalModel = await AuthApiService.getPrincipal();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("$principalModel.nickname"),
        ],
      ),
    );
  }
}
