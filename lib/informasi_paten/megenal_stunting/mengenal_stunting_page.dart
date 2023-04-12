import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/utils/my_color.dart';

class MengenalStuntingPage extends StatelessWidget {
  const MengenalStuntingPage({super.key});

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
                'lib/images/informasi_paten/aditya-romansa-5zp0jym2w9M-unsplash-compress.jpg',
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
                      'Mengenal Stunting Pada Baduta',
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
Stunting adalah kondisi ketika tinggi badan anak lebih pendek dari standar usianya akibat kekurangan gizi dalam jangka panjang. Kondisi ini bisa disebabkan oleh malnutrisi yang dialami ibu saat hamil atau anak pada masa pertumbuhannya. Stunting adalah salah satu gangguan gizi kronik yang terjadi sejak ibu hamil sampai anak berusia 2 tahun.

Ada beberapa faktor yang bisa menyebabkan stunting, antara lain

1. Rendahnya asupan gizi,
2. Praktek pengasuhan yang tidak baik, dan
3. Buruknya fasilitas sanitasi seperti minimnya akses air bersih dan kurangnya kebersihan lingkungan.

Ada 5 pintu utama menuju stunting yang harus diperhatikan, yaitu

1. Saat ibu hamil mengalami kekurangan energi kronis (KEK) dan/atau anemia,
2. kurangnya pemahaman ibu mengenai posisi dan pelekatan saat menyusui,
3. kegagalan dalam memberikan ASI eksklusif,
4. anak sering sakit dan gonta ganti susu formula,
5. serta imunisasi yang tidak teratur.

Gejala stunting antara lain tubuh anak lebih pendek dibandingkan standar tinggi badan anak seusianya, berat badan anak bisa lebih rendah untuk anak seusianya, pertumbuhan tulang terhambat, mudah sakit, gangguan belajar, dan gangguan tumbuh kembang.

Stunting dapat menyebabkan komplikasi seperti gangguan perkembangan otak, penyakit metabolik, dan anak mudah sakit dan terkena infeksi.

Untuk mencegah stunting, ada beberapa hal yang harus dilakukan, seperti memenuhi kebutuhan gizi saat hamil, menggunakan garam beryodium, memberikan ASI eksklusif selama 6 bulan, memberikan ASI sampai 2 tahun, memberikan makanan pendamping ASI (MPASI) yang sehat, memberikan obat cacing, memberikan vitamin A, mencuci tangan dengan benar, memberikan imunisasi dasar lengkap, terus memantau tumbuh kembang anak, selalu menjaga kebersihan lingkungan, dan memenuhi kebutuhan gizi selama 1000 hari pertama kehidupan anak.

Dalam memerangi stunting, peran semua pihak sangat penting. Mulai dari keluarga, masyarakat, hingga pemerintah harus bekerja sama untuk mencegah dan mengatasi stunting agar tercapai generasi bangsa yang sehat dan produktif.

![Alt](resource:lib/images/informasi_paten/materi_stunting.png)

''',

// ![Alt text](https://media.cnn.com/api/v1/images/stellar/prod/220309153016-02-rose-veiled-fairy-wrasse-discovery.jpg)
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
