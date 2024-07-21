import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    var format = NumberFormat('###,###,###,###');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_countryImgUrl != null)
          SizedBox(
            width: double.infinity,
            child: Image.network(
              _countryImgUrl!,
            ),
          )
        else
          const SizedBox(
              width: double.infinity,
              height: 500,
              child: Center(
                child: CircularProgressIndicator(),
              )),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.countryModel.countryNameKor,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.pink,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.countryModel.capital,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "면적 : ${format.format(widget.countryModel.area)}km²",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "인구 : ${format.format(widget.countryModel.population)}명",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "언어 : ${widget.countryModel.language}",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              widget.countryModel.people == null
                  ? const Text("")
                  : Text(
                      "민족 : ${widget.countryModel.people}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
              Text(
                "종교 : ${widget.countryModel.religion}",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
