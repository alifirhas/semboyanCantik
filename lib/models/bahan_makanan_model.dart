import 'package:startertemplate/models/kandungan_gizi_model.dart';

enum GolonganMakanan { gol1, gol2, gol3, gol4, gol5 }

class BahanMakananModel {
  final String id;
  final String judul;
  final String imgPath;
  final KandunganGizi kandunganGizi;
  final double berat;
  final GolonganMakanan golonganMakanan;
  final String catatan;
  final String urt; // Ukuran Rumah Tangga

  BahanMakananModel({
    required this.id,
    required this.judul,
    required this.imgPath,
    required this.kandunganGizi,
    required this.berat,
    required this.golonganMakanan,
    required this.catatan,
    required this.urt,
  });
}
