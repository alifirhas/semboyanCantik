import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:startertemplate/auth/login/login_page_logic.dart';
import 'package:startertemplate/auth/register/register_page.dart';
import 'components/my_login_button.dart';
import '../../components/my_square_tile.dart';

/*

L O G I N P A G E

This is the LoginPage, the first page the user will see based off what was configured in the main.dart file.
This is a minimal aesthetic design, but feel free to decorate it to fit your app.

When considering login users into your app, you must consider AUTHENTICATION:

- email sign in
- google sign in

Once the user is authenticated, they are directed to the homepage.

*/

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Form key
  final _loginFormKey = GlobalKey<FormState>();

  // Logic
  final loginPageLogic = LoginPageLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                // logo
                Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.grey[900],
                ),

                const SizedBox(height: 32),

                // Selamat datang kembali
                Text(
                  'Selamat datang kembali',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // Form login
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      // username textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tolong isi Username';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      // password textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tolong isi Password';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Lupa password?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Lupa Password?',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Log in button
                      MyLoginButton(
                        onTap: () {
                          final form = _loginFormKey.currentState;
                          bool validate = loginPageLogic.validateAccount(
                              usernameController.text, passwordController.text);

                          debugPrint(usernameController.text);
                          debugPrint(passwordController.text);

                          if (form!.validate()) {
                            if (!validate) {
                              GFToast.showToast(
                                'Username atau Password salah',
                                context,
                              );
                            } else {
                              GFToast.showToast(
                                'Berhasil Log In',
                                context,
                              );
                              loginPageLogic.signUserIn(context);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // atau lakukan dengan
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + register sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    const SquareTile(imagePath: 'lib/images/google.png'),

                    const SizedBox(width: 25),

                    // registerbutton
                    SquareTile(
                      imagePath: 'lib/images/register.png',
                      onTap: () {
                        // Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                        debugPrint('Register');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
