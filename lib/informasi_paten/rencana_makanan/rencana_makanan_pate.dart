import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/utils/my_color.dart';

class RencananMakananPage extends StatelessWidget {
  const RencananMakananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.baseColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Gambar
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: Image.asset(
                'lib/images/informasi_paten/hui-sang-FKwGPzwaGqc-unsplash-compress.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // Navigasi
            topNavigation(context),

            // Konten
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: scroll(),
            ),
          ],
        ),
      ),
    );
  }

  topNavigation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Ink(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: MyColors.customWhite,
                  border: Border.all(color: MyColors.customGrey),
                ),
                padding: const EdgeInsets.all(13),
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dekorasi garis
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 100,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),

                // Judul
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Text(
                      'Perencanaan Menu Tepat Gizi Cegah Stunting',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),

                // // Row view count dan tanggal post
                // const SizedBox(height: 8),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       // view count
                //       Text('👀 $viewCount views', style: GoogleFonts.inter()),

                //       // tanggal post
                //       Text(createdAt.toString(), style: GoogleFonts.inter()),
                //     ],
                //   ),
                // ),

                // pisah
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                const SizedBox(height: 16),

                // Markdown content
                MarkdownBody(
                  selectable: true,
                  data: '''
Kehamilan merupakan masa yang sangat penting bagi kesehatan janin. Seorang ibu hamil perlu memperhatikan asupan gizi dan nutrisi yang dikonsumsinya, termasuk dalam pemberian makanan pendamping ASI (MPASI) pada bayi.

Perencanaan menu tepat gizi untuk cegah stunting sedari dini merupakan kunci penting dalam memberikan asupan gizi yang adekuat, aman, dan diberikan dengan cara yang benar. Berikut adalah prinsip-prinsip pemberian MPASI yang perlu diperhatikan:

&nbsp;

## 1. Tepat Waktu

Pemberian MPASI harus dilakukan pada waktu yang tepat. Bayi sebaiknya diperkenalkan dengan makanan padat saat usia 6 bulan. Pada saat itu, bayi telah memiliki kesiapan enzimatik, motorik, dan psikologis untuk memproses makanan padat.

&nbsp;

## 2. Adekuat

Asupan MPASI harus mengandung zat gizi yang adekuat, yaitu karbohidrat, protein, lemak, dan serat yang sesuai dengan kebutuhan bayi. Karbohidrat berfungsi sebagai sumber energi, protein untuk pertumbuhan dan perkembangan otot, lemak untuk perkembangan otak, dan serat untuk menjaga kesehatan pencernaan.

&nbsp;

## 3. Aman

Penyajian MPASI harus dilakukan dengan cara yang aman dan higienis. Persiapan makanan harus dilakukan dengan cermat dan menggunakan bahan-bahan yang aman dan sehat. Penyimpanan makanan harus dilakukan pada suhu yang tepat untuk mencegah pertumbuhan bakteri yang tidak diinginkan.

&nbsp;

## 4. Diberikan dengan Cara yang Benar

Pemberian MPASI harus dilakukan dengan cara yang benar dan responsif. Responsif feeding berarti memberikan makanan dengan memperhatikan respons bayi, seperti kapan bayi lapar, kapan bayi kenyang, dan apa yang disukai bayi.

&nbsp;

Jika asupan zat gizi sesuai kebutuhan bayi (adekuat), maka berat badan dan panjang badan akan bertambah optimal. Berat badan dan panjang badan yang optimal sama dengan bayi yang bertumbuh dengan baik.

Berdasarkan Angka Kecukupan Gizi (AKG) 2019 untuk bayi dan anak, pada usia 6-11 bulan bayi memiliki berat badan 9 kg dan tinggi badan 72 cm dengan kebutuhan energi 800 kcal, protein 15 g, lemak total 31 g, omega 3 0.5 g, omega 6 4.4 g, karbohidrat 105 g, serat 11 g, dan air 900 ml.

Pada usia 1-3 tahun, anak memiliki berat badan 13 kg dan tinggi badan 92 cm dengan kebutuhan energi 1350 kcal, protein 20 g, lemak total 45 g, omega 3 0.7 g, omega 6 7 g, karbohidrat 215 g, serat 19 g, dan air 1150 ml.

Pada usia 4-6 tahun, anak memiliki berat badan 19 kg dan tinggi badan 113 cm dengan kebutuhan energi 1400 kcal, protein 25 g, lemak total 50 g, omega 3 0.9 g, omega 6 10 g, karbohidrat 220 g, serat 20 g, dan air 1450 ml.

''',
                  styleSheet: MarkdownStyleSheet(
                    p: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                    h1: GoogleFonts.inter(),
                    h2: GoogleFonts.inter(),
                    h3: GoogleFonts.inter(),
                    h4: GoogleFonts.inter(),
                    h5: GoogleFonts.inter(),
                    h6: GoogleFonts.inter(),
                    textAlign: WrapAlignment.spaceEvenly,
                  ),
                ),

                // Jarak kosong
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
