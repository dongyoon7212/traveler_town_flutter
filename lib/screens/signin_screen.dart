import 'package:flutter/material.dart';
import 'package:traveler_town/screens/home_screen.dart';
import 'package:traveler_town/screens/signup_screen.dart';
import 'package:traveler_town/services/auth_api_service.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: isSmallScreen
                ? const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _Logo(),
                      _FormContent(),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.all(32.0),
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: const Row(
                      children: [
                        Expanded(child: _Logo()),
                        Expanded(
                          child: Center(child: _FormContent()),
                        ),
                      ],
                    ),
                  )));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset(
            "assets/logo.png",
            height: 100,
          ),
        ),
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({super.key});

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usernameController,
              validator: (value) {
                // add email validation
                if (value == null || value.isEmpty) {
                  return '아이디를 확인해 주세요.';
                }

                // bool emailValid = RegExp(
                //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                //     .hasMatch(value);
                // if (!emailValid) {
                //   return '비밀번호를 확인해 주세요.';
                // }

                return null;
              },
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(22, 68, 113, 1),
                    width: 2,
                  ),
                ),
                floatingLabelStyle: TextStyle(
                  color: Color.fromRGBO(22, 68, 113, 1),
                ),
                labelText: '아이디',
                hintText: '아이디를 입력하세요.',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '아이디를 확인해 주세요.';
                }

                if (value.length < 6) {
                  return '비밀번호를 확인해 주세요.';
                }
                return null;
              },
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(22, 68, 113, 1),
                      width: 2,
                    ),
                  ),
                  floatingLabelStyle: const TextStyle(
                    color: Color.fromRGBO(22, 68, 113, 1),
                  ),
                  labelText: '비밀번호',
                  hintText: '비밀번호를 입력하세요.',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )),
            ),
            _gap(),
            CheckboxListTile(
              value: _rememberMe,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _rememberMe = value;
                });
              },
              title: const Text('자동로그인'),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              contentPadding: const EdgeInsets.all(0),
              activeColor: const Color.fromRGBO(22, 68, 113, 1),
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  backgroundColor: Colors.black.withOpacity(0.8),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    try {
                      String token = await AuthApiService.signin(
                          usernameController.text, passwordController.text);
                      await AuthApiService().saveToken(token);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } catch (e) {
                      // 로그인 실패 시 에러 처리
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('로그인 실패: $e'),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  backgroundColor: Colors.black.withOpacity(0.8),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Signup(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
