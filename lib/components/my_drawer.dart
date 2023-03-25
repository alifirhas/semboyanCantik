import 'package:flutter/material.dart';
import 'package:startertemplate/auth/logout/logout_logic.dart';
import 'package:startertemplate/pages/setting_page.dart';
import '../pages/about_page.dart';

/*

D R A W E R

This is the drawer which the user can open by tapping on the top left menu icon.

This drawer can hold many list tiles. Usually you would place the buttons/pages
that you couldn't fit on the bottom nav bar. 

For e.g. a logout button, an about section, etc.

What pages should the rest of the app contain? 

Remember, just having more and more pages isn't always a good thing.
Sometimes, it's better to be simple and concise in what your app does,
so you include only the absolutely necessary pages and functionality to your app!

*/

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final logoutLogic = LogoutLogic();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(
        children: [
          // Drawer header
          const DrawerHeader(
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/avatar.jpg'),
                radius: 48,
              ),
            ),
          ),

          const SizedBox(height: 25),

          // ABOUT PAGE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
              child: ListTile(
                leading: const Icon(Icons.info),
                title: Text(
                  "A B O U T",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            ),
          ),

          // SETTING PAGE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingPage(),
                  ),
                );
              },
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: Text(
                  "S E T T I N G S",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            ),
          ),

          // LOGOUT BUTTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              onTap: () => logoutLogic.logUserOut(context),
              title: Text(
                "L O G O U T",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
