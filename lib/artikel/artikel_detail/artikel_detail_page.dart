import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/utils/my_color.dart';

class ArtikelDetailPage extends StatelessWidget {
  final String id;
  final String title;
  final String imgPath;
  final String viewCount;
  final String createdAt;
  final String content;

  const ArtikelDetailPage({
    super.key,
    required this.id,
    required this.title,
    required this.imgPath,
    required this.viewCount,
    required this.createdAt,
    required this.content,
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
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: Image.asset(
                imgPath,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Row(
            children: [
              InkWell(
                onTap: () {
                  GFToast.showToast(
                    'Link disimpan dalam clipboard',
                    context,
                  );
                },
                child: Ink(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyColors.customWhite,
                      border: Border.all(color: MyColors.customGrey),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: const Icon(
                      Icons.share_rounded,
                      size: 24,
                      color: MyColors.customBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: () {
                  GFToast.showToast(
                    'Artikel disimpan',
                    context,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: MyColors.customWhite,
                    border: Border.all(color: MyColors.customGrey),
                  ),
                  child: Ink(
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
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
                Center(
                  child: Text(
                    title,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),

                // Row view count dan tanggal post
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // view count
                      Text('👀 $viewCount views', style: GoogleFonts.inter()),

                      // tanggal post
                      Text(createdAt.toString(), style: GoogleFonts.inter()),
                    ],
                  ),
                ),

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
                  data: content,
                  styleSheet: MarkdownStyleSheet(
                    p: GoogleFonts.inter(),
                    h1: GoogleFonts.inter(),
                    h2: GoogleFonts.inter(),
                    h3: GoogleFonts.inter(),
                    h4: GoogleFonts.inter(),
                    h5: GoogleFonts.inter(),
                    h6: GoogleFonts.inter(),
                    textAlign: WrapAlignment.spaceEvenly,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
