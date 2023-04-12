import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuKotak extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String imgPath;
  final Color bgColor;
  final Function()? btnOnTap;

  const MenuKotak({
    super.key,
    required this.title,
    this.subtitle,
    required this.imgPath,
    required this.bgColor,
    this.btnOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: btnOnTap,
      child: Ink(
        child: Container(
          // height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: bgColor,
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // gambar
              Image.asset(
                imgPath,
                height: 65,
              ),
              const SizedBox(height: 8),

              // Title
              Text(
                title,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),

              Visibility(
                visible: subtitle != null,
                child: Flexible(
                  child: Text(
                    '$subtitle',
                    style: GoogleFonts.inter(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
