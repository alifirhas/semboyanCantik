import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:startertemplate/models/jejak_stunting_model.dart';
import 'package:startertemplate/splash/splash_page.dart';
import 'package:startertemplate/utils/my_color.dart';

/*

S T A R T

This is the starting point for all apps. 
Everything starts at the main function

*/
late Box jejakStuntingBox;

Future<void> main() async {
  // lets run our app
  await Hive.initFlutter();
  Hive.registerAdapter(JejakStuntingAdapter());
  jejakStuntingBox = await Hive.openBox('jejakStuntingBox');

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
