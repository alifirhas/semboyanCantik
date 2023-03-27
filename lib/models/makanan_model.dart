class KandunganGizi {
  final double protein;
  final double lemak;
  final double karbo;
  final double energi;

  KandunganGizi({
    required this.protein,
    required this.lemak,
    required this.karbo,
    required this.energi,
  });
}

class MakananModel {
  final String id;
  final String judul;
  final String imgPath;
  final KandunganGizi kandunganGizi;
  final List<String> bahanMakanan;
  final List<String> resep;

  MakananModel({
    required this.id,
    required this.judul,
    required this.imgPath,
    required this.kandunganGizi,
    required this.bahanMakanan,
    required this.resep,
  });
}
