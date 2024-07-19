import 'package:flutter/material.dart';
import 'package:traveler_town/models/country_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CountryInfoScreen extends StatefulWidget {
  const CountryInfoScreen({
    super.key,
    required this.countryModel,
  });

  final CountryModel countryModel;

  @override
  State<CountryInfoScreen> createState() => _CountryInfoScreenState();
}

class _CountryInfoScreenState extends State<CountryInfoScreen> {
  String? _countryImgUrl;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCountryImage();
  }

  Future<void> _fetchCountryImage() async {
    try {
      final storage = FirebaseStorage.instance;
      final ref =
          storage.ref().child('country/${widget.countryModel.countryCode}.gif');
      final url = await ref.getDownloadURL();
      setState(() {
        _countryImgUrl = url;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_countryImgUrl != null)
          SizedBox(
            width: double.infinity,
            child: Image.network(_countryImgUrl!),
          )
        else
          const SizedBox(
              width: double.infinity,
              height: 500,
              child: Center(
                child: CircularProgressIndicator(),
              )),
      ],
    );
  }
}
