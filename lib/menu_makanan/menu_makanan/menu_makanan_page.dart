import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/data/makanan_repository.dart';
import 'package:startertemplate/menu_makanan/menu_makanan/components/menu_item.dart';
import 'package:startertemplate/menu_makanan/menu_makanan_detail/menu_makanan_detail_page.dart';
import 'package:startertemplate/models/makanan_model.dart';
import 'package:startertemplate/utils/my_color.dart';

class MenuMakananPage extends StatefulWidget {
  const MenuMakananPage({super.key});

  @override
  State<MenuMakananPage> createState() => _MenuMakananPageState();
}

class _MenuMakananPageState extends State<MenuMakananPage> {
  // text editing controllers
  final kolomCariController = TextEditingController();

  // scroll menu controllers
  var listMenuScrollController = ScrollController();

  // Data makanan
  List<MakananModel> listMakanan = makananData;

  @override
  void initState() {
    super.initState();

    listMenuScrollController = ScrollController()..addListener(_addMenuItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.baseColor,
      body: SafeArea(
        child: Column(
          children: [
            // Kolom pencarian dan tombol kembali
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Row(
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
                        hintText: 'Cari Menu Makanan...',
                        hintStyle: GoogleFonts.inter(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // List menu makanan
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                controller: listMenuScrollController,
                itemBuilder: (context, index) {
                  final menuItem = listMakanan[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: MenuItem(
                      id: menuItem.id,
                      judul: menuItem.judul,
                      imgPath: menuItem.imgPath,
                      kandunganGizi: menuItem.kandunganGizi,
                      itemOnTap: () {
                        debugPrint('Pergi ke halaman menu-${menuItem.id}');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuMakananDetailPage(
                              id: menuItem.id,
                              judul: menuItem.judul,
                              imgPath: menuItem.imgPath,
                              kandunganGizi: menuItem.kandunganGizi,
                              bahanMakanan: menuItem.bahanMakanan,
                              resep: menuItem.resep,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                itemCount: listMakanan.length,
              ),
            ),

            // Jarak kosong
            // const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _addMenuItems() {
    if (listMenuScrollController.position.pixels ==
        listMenuScrollController.position.maxScrollExtent) {
      // Tambah item dengan filter yang sama
      debugPrint('Sampai batas scroll');
    }
  }
}
