import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/models/makanan_model.dart';
import 'package:startertemplate/utils/my_color.dart';

class MenuMakananDetailPage extends StatelessWidget {
  final String id;
  final String judul;
  final String imgPath;
  final KandunganGizi kandunganGizi;
  final List<String> bahanMakanan;
  final List<String> resep;

  const MenuMakananDetailPage({
    super.key,
    required this.id,
    required this.judul,
    required this.imgPath,
    required this.kandunganGizi,
    required this.bahanMakanan,
    required this.resep,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.baseColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Gambar
            SizedBox(
              width: double.infinity,
              child: Image.asset(imgPath),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Tombol kembali
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: MyColors.customGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: MyColors.customBlack,
                  ),
                ),
              ),
            ),
          ),

          // Tombol share dan bookmark
          Row(
            children: [
              // Tombol share
              InkWell(
                onTap: () {
                  GFToast.showToast(
                    'Link disimpan dalam clipboard',
                    context,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: MyColors.customGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.share_rounded,
                        size: 24,
                        color: MyColors.customBlack,
                      ),
                    ),
                  ),
                ),
              ),

              // Tombol bookmark
              const SizedBox(width: 4),
              InkWell(
                onTap: () {
                  GFToast.showToast(
                    'Menu makanan disimpan',
                    context,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: MyColors.customGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.bookmark,
                        size: 24,
                        color: MyColors.customBlack,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                Text(
                  judul,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),

                // Kandungan energi
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '🔥 ${kandunganGizi.energi} kcal',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                // pisah
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                const SizedBox(height: 16),

                // Header kandungan gizi
                Text(
                  "Kandungan Gizi",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                // Kandungan gizi
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Protein",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${kandunganGizi.protein} g",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lemak",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${kandunganGizi.lemak} g",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Karbohidrat",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${kandunganGizi.karbo} g",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                // Header bahan
                const SizedBox(height: 16),
                Text(
                  "Bahan",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                // Bahan
                const SizedBox(height: 8),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final bahanItem = bahanMakanan[index];

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${index + 1}. ",
                          style: GoogleFonts.inter(),
                        ),
                        Flexible(
                          child: Text(
                            bahanItem,
                            style: GoogleFonts.inter(),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (contenxt, index) {
                    return const SizedBox(height: 4);
                  },
                  itemCount: bahanMakanan.length,
                ),

                // Header cara membuat
                const SizedBox(height: 16),
                Text(
                  "Cara Membuat",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                // Cara membuat
                const SizedBox(height: 8),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final resepItem = resep[index];

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${index + 1}. ",
                          style: GoogleFonts.inter(),
                        ),
                        Flexible(
                          child: Text(
                            resepItem,
                            style: GoogleFonts.inter(),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (contenxt, index) {
                    return const SizedBox(height: 4);
                  },
                  itemCount: resep.length,
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
