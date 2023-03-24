import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startertemplate/introduction/introduction_page.dart';
import 'package:startertemplate/main_page.dart';

class LoginPageLogic {
  bool validateAccount(username, password) {
    if (username != 'admin' && password != 'admin') {
      return false;
    }

    return true;
  }

  void signUserIn(BuildContext context) async {
    final navigator = Navigator.of(context);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('alreadyLogin', true);
    bool alreadyIntro = prefs.getBool('alreadyIntro') ?? false;

    if (alreadyIntro) {
      navigator.pop();
      navigator.push(
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    } else {
      navigator.pop();
      navigator.push(
        MaterialPageRoute(
          builder: (context) => IntroductionPage(),
        ),
      );
    }
  }
}
