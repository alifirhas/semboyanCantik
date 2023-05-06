import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/perhitungan_stunting/jejak_stunting/components/item_jejak_stunting.dart';
import 'package:startertemplate/perhitungan_stunting/jejak_stunting/jejak_stunting_page_logic.dart';
import 'package:startertemplate/utils/my_color.dart';

class JejakStuntingPage extends StatefulWidget {
  const JejakStuntingPage({super.key});

  @override
  State<JejakStuntingPage> createState() => JejakStuntingPageState();
}

class JejakStuntingPageState extends State<JejakStuntingPage> {
  // Page logic
  final jejakStuntingPageLogic = JejakStuntingPageLogic();
  late List<dynamic> listJejakStunting;

  @override
  void initState() {
    listJejakStunting = jejakStuntingPageLogic.getJejakStuntingList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.basePurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Tombol kembali
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

                  const SizedBox(width: 16),

                  Text(
                    "Jejak Stunting",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),

              // List jejak stunting
              const SizedBox(height: 24),
              listJejakStunting.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: MyColors.customWhite,
                            border: Border.all(color: MyColors.customGrey),
                          ),
                          child: Text(
                            'Tidak ada jejak stunting',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemJejakStunting(
                          id: listJejakStunting[index].id,
                          tanggal:
                              listJejakStunting[index].createdDate.toString(),
                          zScore: listJejakStunting[index].zScore,
                          statusStunting:
                              listJejakStunting[index].statusStunting,
                          onTapDelete: () {
                            jejakStuntingPageLogic.deleteJejakStunting(
                                listJejakStunting[index].id);

                            setState(() {
                              listJejakStunting =
                                  jejakStuntingPageLogic.getJejakStuntingList();
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 8);
                      },
                      itemCount: listJejakStunting.length,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
