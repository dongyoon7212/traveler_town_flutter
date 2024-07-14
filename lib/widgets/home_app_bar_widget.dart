import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 50,
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
          onPressed: () {},
          icon: const Icon(
            Icons.bookmark_border_outlined,
            size: 30,
          ),
        )
      ],
    );
  }
}
