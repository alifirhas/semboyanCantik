import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/artikel/artikel/artikel_page.dart';
import 'package:startertemplate/home/components/menu_kotak.dart';
import 'package:startertemplate/informasi_paten/megenal_stunting/mengenal_stunting_page.dart';
import 'package:startertemplate/menu_makanan/menu_makanan/menu_makanan_page.dart';
import 'package:startertemplate/models/artikel_model.dart';
import 'package:startertemplate/perhitungan_stunting/perhitungan_stunting_page.dart';
import 'package:startertemplate/utils/my_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.customWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
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

              // Ucapan hai
              Text(
                'Hai Baduta',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              // Divider
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),

              // // Menu info stunting baduta
              // MenuLebar(
              //   imgPath: 'lib/images/information_carousel_flatline.png',
              //   title: 'Info Stunting Baduta',
              //   description: 'Dapatkan informasi seputar stunting baduta',
              //   titleBtn: 'Mari Lihat',
              //   onTapBtn: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const ArtikelPage(
              //           tipeArtikel: ArtikelType.informasi,
              //         ),
              //       ),
              //     );
              //   },
              // ),

              // // Menu info penyebab dan pencegahan
              // const SizedBox(height: 16),
              // MenuLebar(
              //   imgPath: 'lib/images/doctor_flatline.png',
              //   title: 'Penyebab & Pencegahan Stunting',
              //   description: 'Cegah dan ketahui penyebab stunting',
              //   titleBtn: 'Mari Lihat',
              //   onTapBtn: () {
              //     // Navigator.pop(context);
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const ArtikelPage(
              //           tipeArtikel: ArtikelType.penyebab,
              //         ),
              //       ),
              //     );
              //   },
              // ),
              // const SizedBox(height: 16),

              GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 8,
                mainAxisSpacing: 24,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2, // number of columns
                childAspectRatio: 0.8, // width / height ratio
                children: [
                  // Mengenal stunting baduta
                  MenuKotak(
                    bgColor: MyColors.purple10,
                    title: 'Mengenal Stunting Pada Baduta',
                    imgPath: 'lib/images/heart_hand.png',
                    btnOnTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MengenalStuntingPage(),
                        ),
                      );
                    },
                  ),

                  // Perencanaan menu
                  MenuKotak(
                    bgColor: MyColors.purple10,
                    title: 'Perencanaan Menu Tepat Gizi Cegah Stunting',
                    imgPath: 'lib/images/Healthy_meal_Outline.png',
                    btnOnTap: () {},
                  ),

                  // Artikel info stunting
                  MenuKotak(
                    bgColor: MyColors.pink,
                    title: 'Info Stunting Baduta',
                    subtitle: 'Dapatkan informasi seputar stunting baduta',
                    imgPath: 'lib/images/information_carousel_flatline.png',
                    btnOnTap: () {
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

                  // Artikel penyebab stunting
                  MenuKotak(
                    bgColor: MyColors.pink,
                    title: 'Penyebab & Pencegahan Stunting',
                    subtitle: 'Cegah dan ketahui penyebab stunting',
                    imgPath: 'lib/images/doctor_flatline.png',
                    btnOnTap: () {
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
                ],
              ),
              const SizedBox(height: 24),

              // Menu makanan dan periksa stunting
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 24,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Menu makanan baduta
                  MenuKotak(
                    bgColor: MyColors.purple10,
                    title: 'Menu Makanan Baduta',
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

                  // Periksa stunting
                  MenuKotak(
                    bgColor: MyColors.purple10,
                    title: 'Periksa Stunting',
                    imgPath: 'lib/images/Calculator_Outline.png',
                    btnOnTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PerhitunganStuntingPage(),
                        ),
                      );
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
    );
  }
}
