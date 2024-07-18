import 'package:flutter/material.dart';
import 'package:traveler_town/models/country_model.dart';
import 'package:traveler_town/screens/country_info_screen.dart';
import 'package:traveler_town/services/country_api_service.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  List<CountryModel> _countries = [];

  @override
  void initState() {
    super.initState();
    _loadCountries();
  }

  Future<void> _loadCountries() async {
    try {
      final countries = await CountryApiService.getCountryAll();
      setState(() {
        _countries = countries;
      });
    } catch (e) {
      print('Failed to load countries: $e');
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
          child: Autocomplete<CountryModel>(
            optionsMaxHeight: 400,
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<CountryModel>.empty();
              }
              return _countries.where(
                (CountryModel country) {
                  return country.countryNameKor
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                },
              );
            },
            displayStringForOption: (CountryModel option) {
              return option.countryNameKor;
            },
            fieldViewBuilder:
                (context, controller, focusNode, onFieldSubmitted) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
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
              );
            },
            onSelected: (CountryModel selection) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CountryInfoScreen(countryModel: selection),
                ),
              );
            },
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
