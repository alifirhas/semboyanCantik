import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/introduction/introduction_page_logic.dart';
import 'package:startertemplate/utils/my_color.dart';

class IntroductionPage extends StatelessWidget {
  IntroductionPage({super.key});

  final introductionPageLogic = IntroductionPageLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar
                Image.asset(
                  'lib/images/Health_Monochromatic.png',
                  // height: 400,
                  width: MediaQuery.of(context).size.width,
                ),

                // Moto (?)
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Text(
                    'Lawan Stunting,',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: MyColors.customBlack,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Text(
                    'Ciptakan Generasi Sehat',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: MyColors.customBlack,
                      fontSize: 24,
                    ),
                  ),
                ),

                // Deskripsi
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Text(
                    'Cari informasi stunting dan ketahui gejala stunting lebih awal',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      color: MyColors.customBlack,
                      fontSize: 14,
                    ),
                  ),
                ),

                // Tombol ke home
                const SizedBox(height: 56),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.purple,
                        ),
                        onPressed: () {
                          // GFToast.showToast(
                          //   'Hello',
                          //   context,
                          // );
                          introductionPageLogic.keHalamanHome(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text(
                            'Mari Mulai',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: MyColors.customWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
