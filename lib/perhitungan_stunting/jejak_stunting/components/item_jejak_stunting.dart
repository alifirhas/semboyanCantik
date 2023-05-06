import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/utils/my_color.dart';

class ItemJejakStunting extends StatefulWidget {
  final String id;
  final String tanggal;
  final double zScore;
  final String statusStunting;

  const ItemJejakStunting({
    super.key,
    required this.id,
    required this.tanggal,
    required this.zScore,
    required this.statusStunting,
  });

  @override
  State<ItemJejakStunting> createState() => ItemJejakStuntingState();
}

class ItemJejakStuntingState extends State<ItemJejakStunting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: MyColors.customWhite,
        border: Border.all(color: MyColors.customGrey),
      ),
      child: ListTile(
        title: Text(
          widget.tanggal,
          style: GoogleFonts.inter(fontSize: 16),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // nilai z-score
            Text(
              widget.zScore.toString(),
              style: GoogleFonts.inter(
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),

            // status stunting
            Text(
              widget.statusStunting,
              style: GoogleFonts.inter(
                fontSize: 14,
              ),
            ),
          ],
        ),
        trailing: GestureDetector(
          child: Icon(
            Icons.delete_outline,
            color: Colors.red.shade400,
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Hapus jejak stunting'),
                  content: const Text('Yakin ingin menghapus jejak stunting?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        debugPrint("Tidak");
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Tidak',
                        style: GoogleFonts.inter(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Hapus jejak stunting
                        debugPrint("Hapus");
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Hapus',
                        style: GoogleFonts.inter(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
