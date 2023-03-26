enum ArtikelType { penyebab, informasi, blank }

class ArtikelModel {
  final String title;
  final String imgPath;
  final String viewCount;
  final DateTime createdAt;
  final String content;
  final ArtikelType type;

  ArtikelModel({
    required this.title,
    required this.imgPath,
    required this.viewCount,
    required this.createdAt,
    required this.content,
    required this.type,
  });
}
