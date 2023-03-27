import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/artikel/artikel/artikel_page.dart';
import 'package:startertemplate/home/components/menu_kotak.dart';
import 'package:startertemplate/home/components/menu_lebar.dart';
import 'package:startertemplate/menu_makanan/menu_makanan/menu_makanan_page.dart';
import 'package:startertemplate/models/artikel_model.dart';
import 'package:startertemplate/utils/my_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.customWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                InkWell(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyColors.customWhite,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('lib/images/avatar.jpg'),
                      radius: 32,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Ucapan selamat datang
                Text(
                  'Selamat Datang',
                  style: GoogleFonts.inter(fontSize: 14),
                ),
                Text(
                  'Emely Soehat',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),

                // Divider
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 24),

                // Menu info stunting balita
                MenuLebar(
                  imgPath: 'lib/images/information_carousel_flatline.png',
                  title: 'Info Stunting Balita',
                  description: 'Dapatkan informasi seputar stunting balita',
                  titleBtn: 'Mari Lihat',
                  onTapBtn: () {
                    // Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ArtikelPage(
                          tipeArtikel: ArtikelType.informasi,
                        ),
                      ),
                    );
                  },
                ),

                // Menu info penyebab dan pencegahan
                const SizedBox(height: 16),
                MenuLebar(
                  imgPath: 'lib/images/doctor_flatline.png',
                  title: 'Penyebab & Pencegahan Stunting',
                  description: 'Cegah dan ketahui penyebab stunting',
                  titleBtn: 'Mari Lihat',
                  onTapBtn: () {
                    // Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ArtikelPage(
                          tipeArtikel: ArtikelType.penyebab,
                        ),
                      ),
                    );
                  },
                ),

                // Menu makanan dan kalkulator
                const SizedBox(height: 16),

                GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    MenuKotak(
                      title: 'Menu Makanan Balita',
                      imgPath: 'lib/images/baby.png',
                      btnOnTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuMakananPage(),
                          ),
                        );
                      },
                    ),
                    MenuKotak(
                      title: 'Periksa Stunting',
                      imgPath: 'lib/images/Calculator_Outline.png',
                      btnOnTap: () {
                        debugPrint('kalkulator');
                      },
                    ),
                  ],
                ),

                // Jarak kosong
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
