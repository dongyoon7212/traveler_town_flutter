import 'package:flutter/material.dart';
import 'package:traveler_town/models/principal_model.dart';
import 'package:traveler_town/services/auth_api_service.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  void printPrincipal() async {
    try {
      PrincipalModel principal = await AuthApiService.getPrincipal();
      print('User ID: ${principal.userId}');
      print('Username: ${principal.username}');
      print('Nickname: ${principal.nickname}');
      print('Email: ${principal.email}');
      print('Sex: ${principal.sex}');
      print('Age: ${principal.age}');
      print('Profile Image: ${principal.profileImg}');
      print('Authorities: ${principal.authorities.join(', ')}');
    } catch (e) {
      print('Failed to get principal: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 45,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 240,
          height: 38,
          child: TextField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: const Color.fromRGBO(22, 68, 113, 1),
            style: const TextStyle(
              fontSize: 14,
            ),
            cursorHeight: 20,
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: 27,
              ),
              hintText: "여행할 국가를 검색해보세요!",
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            printPrincipal();
          },
          icon: const Icon(
            Icons.bookmark_border_outlined,
            size: 30,
          ),
        )
      ],
    );
  }
}
