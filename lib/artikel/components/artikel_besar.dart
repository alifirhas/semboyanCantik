import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/utils/my_color.dart';

class ArtikelBesar extends StatelessWidget {
  final String id;
  final String title;
  final String imgPath;
  final String viewCount;
  final String createdAt;
  final Function()? cardOnTap;

  const ArtikelBesar({
    super.key,
    required this.id,
    required this.title,
    required this.imgPath,
    required this.viewCount,
    required this.createdAt,
    this.cardOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardOnTap,
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      imgPath,
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
                children: [
                  // view count
                  Text('👀 $viewCount views', style: GoogleFonts.inter()),

                  // tanggal post
                  Text(createdAt.toString(), style: GoogleFonts.inter()),
                ],
              ),
            ),

            // Judul
            const SizedBox(height: 16),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  title,
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
