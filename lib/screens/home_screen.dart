import 'package:flutter/material.dart';
import 'package:traveler_town/models/country_model.dart';
import 'package:traveler_town/screens/country_info_screen.dart';
import 'package:traveler_town/screens/mypage_screen.dart';
import 'package:traveler_town/screens/signin_screen.dart';
import 'package:traveler_town/services/auth_api_service.dart';
import 'package:traveler_town/widgets/bottom_navigation_bar_widget.dart';
import 'package:traveler_town/widgets/home_app_bar_widget.dart';
import 'package:traveler_town/widgets/home_body_widget.dart';
import 'package:traveler_town/screens/restaurant_screen.dart';
import 'package:traveler_town/screens/together_screen.dart';
import 'package:traveler_town/screens/travel_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _widgetOption = <Widget>[
    HomeBody(),
    const Together(),
    const Travel(),
    const Restaurant(),
    const Mypage(),
  ];

  bool showAppBar = true;
  int _selectedIndex = 0;
  CountryModel? _selectedCountry;

  void _onItemTapped(int index) async {
    if (index == 4) {
      try {
        await AuthApiService.getPrincipal();
        setState(() {
          showAppBar = false;
          _selectedIndex = index;
        });
      } catch (e) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignIn()),
        );
      }
    } else {
      setState(() {
        showAppBar = true;
        _selectedIndex = index;
        _selectedCountry = null; // Clear selected country if any
      });
    }
  }

  void _onCountrySelected(CountryModel country) {
    setState(() {
      _selectedCountry = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: showAppBar
          ? AppBar(
              title: HomeAppBar(
                onCountrySelected: _onCountrySelected,
              ),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              foregroundColor: const Color.fromRGBO(22, 68, 113, 1),
              shape: const Border(
                bottom: BorderSide(
                  width: 0.1,
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: _selectedCountry == null
            ? _widgetOption.elementAt(_selectedIndex)
            : CountryInfoScreen(countryModel: _selectedCountry!),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
