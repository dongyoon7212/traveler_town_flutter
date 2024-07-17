import 'package:flutter/material.dart';
import 'package:traveler_town/models/principal_model.dart';
import 'package:traveler_town/screens/signin_screen.dart';
import 'package:traveler_town/services/auth_api_service.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  PrincipalModel? principal;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPrincipal();
  }

  Future<void> _fetchPrincipal() async {
    try {
      PrincipalModel fetchedPrincipal = await AuthApiService.getPrincipal();
      if (!mounted) {
        return; // ensures that the widget is still in the widget tree
      }
      setState(() {
        principal = fetchedPrincipal;
        _isLoading = false;
      });
    } catch (e) {
      // Handle the error by navigating to the SignIn screen
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignIn(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("mypage"),
      ),
    );
  }
}
