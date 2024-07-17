import 'package:flutter/material.dart';
import 'package:traveler_town/models/principal_model.dart';
import 'package:traveler_town/services/auth_api_service.dart';

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PrincipalModel>(
      future: AuthApiService.getPrincipal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No Data'));
        } else {
          PrincipalModel principalModel = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(principalModel.nickname),
                // Display other information from principalModel
              ],
            ),
          );
        }
      },
    );
  }
}
