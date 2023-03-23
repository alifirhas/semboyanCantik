import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startertemplate/auth/login/login_page.dart';
import 'package:startertemplate/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with AfterLayoutMixin<SplashPage> {
  Future checkFirst() async {
    final navigator = Navigator.of(context);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool alreadyLogin = prefs.getBool('alreadyLogin') ?? false;

    if (alreadyLogin) {
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
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirst();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Container(
            alignment: const Alignment(0, 0.5),
            child: Column(
              children: const [
                // SizedBox(
                //   height: 160,
                //   child: Image.asset(
                //       'assets/images/illustration/rocket_green.png'),
                // ),
                SizedBox(height: 16),
                GFLoader(
                  type: GFLoaderType.circle,
                ),
                SizedBox(height: 16),
                Text('Loading...'),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
