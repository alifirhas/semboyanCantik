import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startertemplate/main_page.dart';

class IntroductionPageLogic {
  void keHalamanHome(BuildContext context) async {
    final navigator = Navigator.of(context);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('alreadyIntro', true);

    navigator.pop();
    navigator.push(
      MaterialPageRoute(
        builder: (context) => const MainPage(),
      ),
    );
  }
}
