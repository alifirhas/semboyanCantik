import 'package:flutter/material.dart';
import 'package:startertemplate/components/my_drawer.dart';
import 'package:startertemplate/home/home_page.dart';

/*

M A I N P A G E

This is the MainPage. I like to think of the MainPage as the holder of all other pages.
So on this page, we have a bottom navigation bar which the user can tap. This will navigate
the app screen to the any of the ones in the 'pages' folder:

- Home Page
- Shop Page
- Profile Page
- Setting Page

*/

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    /*

    UI - I like a more minimal style so that's what I did here, 
    but you can change up the colors and decorate it to your preference

    */
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: MyDrawer(),
      body: const HomePage(),
    );
  }
}
