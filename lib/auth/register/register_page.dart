import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:startertemplate/auth/register/register_page_logic.dart';
import 'package:startertemplate/components/my_square_tile.dart';
import 'components/my_register_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final namaController = TextEditingController();

  // Form key
  final _loginFormKey = GlobalKey<FormState>();

  // Logic
  final registerPageLogic = RegisterPageLogic();

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
                Image.asset(
                  'lib/images/register.png',
                  height: 100,
                ),

                const SizedBox(height: 32),

                // Mari daftar
                Text(
                  'Mari daftar',
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
                      // nama textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: namaController,
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
                            hintText: 'Nama',
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tolong isi Nama';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

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
                      MyRegisterButton(
                        onTap: () {
                          final form = _loginFormKey.currentState;

                          if (form!.validate()) {
                            GFToast.showToast(
                              'Berhasil Register',
                              context,
                            );

                            registerPageLogic.keHalamanLogin(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // atau login
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
                          'Atau Login',
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

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Login
                    SquareTile(
                      imagePath: 'lib/images/login.png',
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

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
