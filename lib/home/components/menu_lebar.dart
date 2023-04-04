import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/utils/my_color.dart';

class MenuLebar extends StatelessWidget {
  final String imgPath;
  final String title;
  final String description;
  final String titleBtn;
  final Function()? onTapBtn;

  const MenuLebar({
    super.key,
    required this.imgPath,
    required this.title,
    required this.description,
    required this.titleBtn,
    this.onTapBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: MyColors.pink,
      ),
      child: Row(
        children: [
          // Images
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 113,
              child: Image.asset(imgPath),
            ),
          ),

          // Judul dan btn
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul
                const SizedBox(height: 16),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      title,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      description,
                      style: GoogleFonts.inter(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ),

                // Button ke halaman lain atau aksi lain
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: onTapBtn,
                        child: Ink(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: MyColors.purple,
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              titleBtn,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: MyColors.customWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
