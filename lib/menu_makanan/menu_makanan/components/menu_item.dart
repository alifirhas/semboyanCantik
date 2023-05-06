import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/models/kandungan_gizi_model.dart';
import 'package:startertemplate/utils/my_color.dart';

class MenuItem extends StatelessWidget {
  final String id;
  final String judul;
  final String imgPath;
  final KandunganGizi kandunganGizi;
  final Function()? itemOnTap;

  const MenuItem({
    super.key,
    required this.id,
    required this.judul,
    required this.imgPath,
    required this.kandunganGizi,
    required this.itemOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: itemOnTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: MyColors.customWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                height: 100,
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

            // Column judul dan kandungan gizi
            const SizedBox(height: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Judul
                  const SizedBox(height: 16),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        judul,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                  // Kandungan gizi protein, lemak, dan karbo
                  // ! Sementara disembunyikan
                  // const SizedBox(height: 8),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  //   child: Text(
                  //     'Protein ${kandunganGizi.protein} g',
                  //     style: GoogleFonts.inter(
                  //       fontSize: 14,
                  //       color: Colors.grey.shade600,
                  //     ),
                  //     maxLines: 3,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),
                  // const SizedBox(height: 4),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  //   child: Text(
                  //     'Lemak ${kandunganGizi.lemak} g',
                  //     style: GoogleFonts.inter(
                  //       fontSize: 14,
                  //       color: Colors.grey.shade600,
                  //     ),
                  //     maxLines: 3,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),
                  // const SizedBox(height: 4),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  //   child: Text(
                  //     'Karbohidrat ${kandunganGizi.karbo} g',
                  //     style: GoogleFonts.inter(
                  //       fontSize: 14,
                  //       color: Colors.grey.shade600,
                  //     ),
                  //     maxLines: 3,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),

                  // Energi di pojok kanan
                  // const Spacer(),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
