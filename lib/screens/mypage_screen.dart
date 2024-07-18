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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
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
                _gap(),
                Text(
                  principalModel.nickname,
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
