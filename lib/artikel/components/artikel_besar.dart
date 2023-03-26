import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/utils/my_color.dart';

class ArtikelBesar extends StatelessWidget {
  const ArtikelBesar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Pergi ke halaman artikel detail');
      },
      child: Container(
        width: 200,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: MyColors.customWhite,
        ),
        child: Column(
          children: [
            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                height: 150,
                // width: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'lib/images/artikel/bayi.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Row view count dan tanggal post
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // view count
                  Text('👀 128 views'),

                  // tanggal post
                  Text('2 hari lalu'),
                ],
              ),
            ),

            // Judul
            const SizedBox(height: 16),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Judul Judul Judul Judul Judul Judul Judul Judul ',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
