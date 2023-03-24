import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startertemplate/auth/login/login_page.dart';

class LogoutLogic {
  void logUserOut(BuildContext context) async {
    final navigator = Navigator.of(context);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setBool('alreadyIntro', true);

    // pop drawer
    navigator.pop();
    // pop app
    navigator.pop();
    // go back to login page
    navigator.push(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
