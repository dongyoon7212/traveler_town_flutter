import 'package:flutter/material.dart';
import 'package:traveler_town/models/country_model.dart';

class CountryInfoScreen extends StatelessWidget {
  const CountryInfoScreen({
    super.key,
    required this.countryModel,
  });

  final CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: double.infinity,
          // child: Image.network(),
        )
      ],
    );
  }
}
