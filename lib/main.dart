import 'package:flutter/material.dart';
import 'package:startertemplate/splash/splash_page.dart';
import 'package:startertemplate/utils/my_color.dart';

/*

S T A R T

This is the starting point for all apps. 
Everything starts at the main function

*/
void main() {
  // lets run our app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MyColors.pinkMaterial,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      // this is bringing us to the SplashPage first
      home: const SplashPage(),
    );
  }
}
