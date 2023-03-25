import 'package:flutter/material.dart';
import 'package:startertemplate/home/components/menu_kotak.dart';
import 'package:startertemplate/home/components/menu_lebar.dart';
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
                const Text(
                  'Selamat Datang',
                  style: TextStyle(fontSize: 14),
                ),
                const Text(
                  'Emely Soehat',
                  style: TextStyle(
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
                    debugPrint('informasi');
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
                    debugPrint('penyebab');
                  },
                ),

                // Menu makanan dan kalkulator
                const SizedBox(height: 16),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     MenuKotak(),
                //     MenuKotak(),
                //   ],
                // ),

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
                        debugPrint('Menu');
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
