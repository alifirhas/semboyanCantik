import 'package:flutter/material.dart';
import 'package:startertemplate/auth/login/login_page.dart';

class RegisterPageLogic {
  void keHalamanLogin(BuildContext context) {
    // once user is authenticated, direct them to the main page
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
