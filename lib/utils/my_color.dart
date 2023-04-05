import 'package:flutter/material.dart';

class MyColors {
  static const Color purple = Color.fromARGB(255, 139, 134, 226);
  static const Color purple10 = Color.fromARGB(26, 139, 134, 226);
  static const Color pink = Color.fromARGB(255, 254, 224, 243);
  static const Color customWhite = Color.fromARGB(255, 252, 254, 255);
  static const Color customBlack = Color.fromARGB(255, 50, 48, 58);
  static const Color customGrey = Color.fromARGB(255, 217, 217, 217);
  static const Color baseColor = Color.fromARGB(255, 245, 245, 245);
  static const Color basePurple = Color.fromARGB(255, 238, 233, 246);

  static const MaterialColor pinkMaterial = MaterialColor(
    0xfee0f3, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffe5cadb), //10%
      100: Color(0xffcbb3c2), //20%
      200: Color(0xffb29daa), //30%
      300: Color(0xff988692), //40%
      400: Color(0xff7f707a), //50%
      500: Color(0xff665a61), //60%
      600: Color(0xff4c4349), //70%
      700: Color(0xff332d31), //80%
      800: Color(0xff191618), //90%
      900: Color(0xff000000), //100%
    },
  );
}
