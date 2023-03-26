import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/utils/my_color.dart';

class ArtikelKecil extends StatelessWidget {
  final String id;
  final String title;
  final String imgPath;
  final String viewCount;
  final String createdAt;
  final Function()? cardOnTap;

  const ArtikelKecil({
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
            const SizedBox(height: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
          ],
        ),
      ),
    );
  }
}
