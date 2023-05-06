import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/perhitungan_stunting/jejak_stunting/components/item_jejak_stunting.dart';
import 'package:startertemplate/utils/my_color.dart';

class JejakStuntingPage extends StatefulWidget {
  const JejakStuntingPage({super.key});

  @override
  State<JejakStuntingPage> createState() => JejakStuntingPageState();
}

class JejakStuntingPageState extends State<JejakStuntingPage> {
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
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const ItemJejakStunting(
                    id: "1",
                    tanggal: "06 Mei 2023",
                    zScore: -0.66,
                    statusStunting: "Normal",
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
