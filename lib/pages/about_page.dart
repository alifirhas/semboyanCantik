import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*

A B O U T P A G E

This is the AboutPage. This is usually a static page that displays lots of text
describing what your app/business does.

This is also a great place to give the user a link or email that they can use 
to give any feedback about the app.

*/

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Text(
          'A B O U T',
          style: TextStyle(color: Colors.grey[800]),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Image.asset(
                'lib/images/logo.png',
                height: 100,
              ),
              // Tentang aplikasi
              Text(
                'Semboyan Cantik',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Aplikasi cegah stunting baduta umur 0 tahun sampai 2 tahun',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
