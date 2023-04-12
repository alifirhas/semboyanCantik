import 'package:startertemplate/models/kandungan_gizi_model.dart';

enum SatuanUsia { bulan, tahun }

class KategoriUsia {
  final int minimum;
  final int maximum;
  final SatuanUsia satuanUsia;

  KategoriUsia({
    required this.minimum,
    required this.maximum,
    required this.satuanUsia,
  });
}

class MakananModel {
  final String id;
  final String judul;
  final String imgPath;
  final KandunganGizi kandunganGizi;
  final double berat;
  final KategoriUsia kategoriUsia;
  final List<String> bahanMakanan;
  final List<String> resep;
  final String tekstur;
  final String frekuensi;
  final String jumlahTiapMakan;
  final String catatan;

  MakananModel({
    required this.id,
    required this.judul,
    required this.imgPath,
    required this.kandunganGizi,
    required this.berat,
    required this.kategoriUsia,
    required this.bahanMakanan,
    required this.resep,
    required this.tekstur,
    required this.frekuensi,
    required this.jumlahTiapMakan,
    required this.catatan,
  });
}
