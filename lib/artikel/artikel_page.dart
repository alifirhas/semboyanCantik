import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:startertemplate/artikel/artikel_page_logic.dart';
import 'package:startertemplate/artikel/components/artikel_besar.dart';
import 'package:startertemplate/artikel/components/artikel_kecil.dart';
import 'package:startertemplate/data/artikel_repository.dart';
import 'package:startertemplate/models/artikel_model.dart';
import 'package:startertemplate/utils/my_color.dart';

class ArtikelPage extends StatefulWidget {
  final ArtikelType tipeArtikel;

  const ArtikelPage({super.key, required this.tipeArtikel});

  @override
  State<ArtikelPage> createState() => _ArtikelPageState();
}

class _ArtikelPageState extends State<ArtikelPage> {
  // Dateformater
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  // text editing controllers
  final kolomCariController = TextEditingController();

  // scroll artikel controllers
  var jelajahiArtikelScrollController = ScrollController();

  final artikelPageLogic = ArtikelPageLogic();

  // Data artikel
  List<ArtikelModel> listArtikel = artikelData;
  List<ArtikelModel> artikelPopuler = [];

  @override
  void initState() {
    super.initState();

    jelajahiArtikelScrollController = ScrollController()
      ..addListener(_addArtikel);
    listArtikel =
        artikelPageLogic.getArtikelByType(listArtikel, widget.tipeArtikel);
    artikelPopuler = artikelPageLogic.artikelPopuler(listArtikel);
    listArtikel = artikelPageLogic.artikelSortId(listArtikel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.baseColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kolom pencarian dan Tombol kembali
                Row(
                  children: [
                    // Tombol kembali
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColors.customGrey),
                          borderRadius: BorderRadius.circular(9),
                          color: MyColors.customWhite,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(13),
                          child: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                      ),
                    ),

                    // Jarak
                    const SizedBox(width: 8),

                    // Kolom pencarian
                    Flexible(
                      child: TextField(
                        controller: kolomCariController,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColors.customGrey),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: MyColors.customWhite,
                          filled: true,
                          hintText: 'Cari Artikel...',
                          hintStyle: GoogleFonts.inter(
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Header Artikel populer
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Judul
                    Text(
                      'Populer',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),

                    // Lihat lebih banyak
                    Text(
                      'Lihat lebih banyak',
                      style: GoogleFonts.inter(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                // List artikel populer
                const SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 8);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: artikelPopuler.length,
                    itemBuilder: (context, index) {
                      final artikelItem = artikelPopuler[index];

                      return ArtikelBesar(
                        id: artikelItem.id,
                        title: artikelItem.title,
                        imgPath: artikelItem.imgPath,
                        viewCount: artikelItem.viewCount,
                        createdAt: formatter.format(
                            DateTime.parse(artikelItem.createdAt.toString())),
                        cardOnTap: () {
                          debugPrint(
                              'Ke artikel-${artikelPopuler.elementAt(index).id} detail');
                        },
                      );
                    },
                  ),
                ),

                // Header Jelajahi artikel lain
                const SizedBox(height: 16),
                Text(
                  'Jelajahi',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),

                // List jelajahi artikel lain
                const SizedBox(height: 16),
                ListView.separated(
                  controller: jelajahiArtikelScrollController,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8);
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: listArtikel.length,
                  itemBuilder: (context, index) {
                    final artikelItem = listArtikel[index];

                    return ArtikelKecil(
                      id: artikelItem.id,
                      title: artikelItem.title,
                      imgPath: artikelItem.imgPath,
                      viewCount: artikelItem.viewCount,
                      createdAt: formatter.format(
                          DateTime.parse(artikelItem.createdAt.toString())),
                      cardOnTap: () {
                        debugPrint('Ke artikel-${artikelItem.id} detail');
                      },
                    );
                  },
                ),

                // Jarak kosong
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addArtikel() {
    if (jelajahiArtikelScrollController.position.pixels ==
        jelajahiArtikelScrollController.position.maxScrollExtent) {
      // Tambah item dengan filter yang sama
      debugPrint('Sampai batas scroll');
    }
  }
}
