import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startertemplate/main_page.dart';

class LoginPageLogic {
  bool validateAccount(username, password) {
    if (username != 'admin' && password != 'admin') {
      return false;
    }

    return true;
  }

  void signUserIn(BuildContext context) async {
    // once user is authenticated, direct them to the main page
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('alreadyLogin', true);

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainPage(),
      ),
    );
  }
}
