import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/utils/my_color.dart';

class ArtikelKecil extends StatelessWidget {
  const ArtikelKecil({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Pergi ke halaman artikel detail');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 135,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: MyColors.customWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Column view count dan tanggal post
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        'Judul Judul Judul Judul Judul Judul Judul Judul',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                height: 135,
                width: 125,
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
          ],
        ),
      ),
    );
  }
}
