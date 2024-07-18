import 'dart:async';
import 'package:flutter/material.dart';
import 'package:traveler_town/models/principal_model.dart';
import 'package:traveler_town/services/auth_api_service.dart';

class EditMypageScreen extends StatefulWidget {
  const EditMypageScreen({super.key});

  @override
  State<EditMypageScreen> createState() => _EditMypageScreenState();
}

class _EditMypageScreenState extends State<EditMypageScreen> {
  late int sex;
  late int age;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPrincipalData();
  }

  Future<void> _loadPrincipalData() async {
    PrincipalModel principalModel = await AuthApiService.getPrincipal();
    setState(() {
      sex = principalModel.sex;
      age = principalModel.age;
      isLoading = false;
    });
  }

  void editTap() async {
    AuthApiService.editSex(sex);
    AuthApiService.editAge(age);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('성공'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('정보가 변경되었습니다'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "내 정보 수정",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 50,
                ),
                child: Column(
                  children: [
                    DropdownButtonFormField<int?>(
                      value: sex,
                      dropdownColor: Colors.white,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        labelText: '성별',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: TextStyle(
                          fontSize: 30,
                          color: Color(0xff333333),
                        ),
                      ),
                      items: [0, 1, 2].map<DropdownMenuItem<int?>>((int? i) {
                        return DropdownMenuItem<int?>(
                          value: i,
                          child: Text({1: '남성', 2: '여성'}[i] ?? '비공개'),
                        );
                      }).toList(),
                      onChanged: (int? value) {
                        setState(() {
                          sex = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField<int?>(
                      value: age,
                      dropdownColor: Colors.white,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        labelText: '나이대',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: TextStyle(
                          fontSize: 30,
                          color: Color(0xff333333),
                        ),
                      ),
                      items: [10, 20, 30, 40, 50, 60, 70, 80, 90]
                          .map<DropdownMenuItem<int?>>((int? i) {
                        return DropdownMenuItem<int?>(
                          value: i,
                          child: Text({
                                10: '10대',
                                20: '20대',
                                30: "30대",
                                40: "40대",
                                50: "50대",
                                60: "60대",
                                70: "70대",
                                80: "80대",
                                90: "90대",
                              }[i] ??
                              '비공개'),
                        );
                      }).toList(),
                      onChanged: (int? value) {
                        setState(() {
                          age = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 400,
                    ),
                    IconButton(
                        onPressed: editTap,
                        icon: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.check,
                            size: 40,
                          ),
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}
