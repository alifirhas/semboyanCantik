import 'package:startertemplate/models/artikel_model.dart';

List<ArtikelModel> artikelData = [
  // Informasi
  ArtikelModel(
    id: '1',
    title: 'Mengenali Gejala Stunting pada Balita yang Perlu Diperhatikan',
    imgPath: 'lib/images/artikel/artikel1.jpg',
    viewCount: '92',
    createdAt: DateTime(2023, 1, 18),
    content:
        'Stunting merupakan masalah gizi yang menghambat pertumbuhan balita. Gejala stunting pada balita dapat dikenali melalui berbagai tanda seperti tinggi badan dan berat badan yang tidak sesuai dengan usia serta kondisi balita yang sering sakit. Orangtua dan petugas kesehatan perlu memperhatikan gejala stunting untuk mencegah dampak buruk pada kesehatan balita.',
    type: ArtikelType.informasi,
  ),
  ArtikelModel(
    id: '2',
    title: 'Faktor Penyebab Stunting pada Balita dan Cara Mengatasinya',
    imgPath: 'lib/images/artikel/artikel2.jpg',
    viewCount: '39',
    createdAt: DateTime(2023, 2, 10),
    content:
        'Stunting pada balita bisa disebabkan oleh berbagai faktor, mulai dari asupan gizi yang kurang hingga infeksi yang sering terjadi. Orangtua dan petugas kesehatan harus memperhatikan faktor penyebab stunting dan mencari cara untuk mengatasinya, seperti memberikan asupan gizi yang cukup, memberikan imunisasi, dan menghindari paparan lingkungan yang tidak sehat.',
    type: ArtikelType.informasi,
  ),
  ArtikelModel(
    id: '3',
    title: 'Mengenal Stunting Balita dan Dampaknya pada Kesehatan',
    imgPath: 'lib/images/artikel/bayi.jpg',
    viewCount: '57',
    createdAt: DateTime(2023, 3, 22),
    content:
        'Stunting balita merupakan masalah serius yang dapat mempengaruhi kesehatan dan perkembangan anak. Dampak stunting pada balita antara lain menghambat perkembangan otak dan sistem kekebalan tubuh, meningkatkan risiko penyakit, serta memperburuk kondisi kesehatan saat dewasa nanti. Artikel ini akan membahas lebih detail tentang stunting balita dan dampaknya pada kesehatan.',
    type: ArtikelType.informasi,
  ),
  ArtikelModel(
    id: '4',
    title: 'Mengoptimalkan Asupan Gizi Balita untuk Mencegah Stunting',
    imgPath: 'lib/images/artikel/artikel3.jpg',
    viewCount: '1',
    createdAt: DateTime(2023, 4, 03),
    content:
        'Asupan gizi yang cukup sangat penting untuk mencegah stunting pada balita. Orangtua dan keluarga perlu mengoptimalkan asupan gizi anak, baik dari sumber makanan maupun suplemen gizi yang diperlukan. Artikel ini akan memberikan informasi tentang jenis makanan yang baik untuk balita dan bagaimana cara mengoptimalkan asupan gizi.',
    type: ArtikelType.informasi,
  ),
  ArtikelModel(
    id: '5',
    title: 'Peran Penting Keluarga dalam Mencegah Stunting Balita',
    imgPath: 'lib/images/artikel/artikel5.jpg',
    viewCount: '84',
    createdAt: DateTime(2023, 5, 07),
    content:
        'Keluarga memegang peran yang sangat penting dalam mencegah stunting pada balita. Orangtua perlu memastikan anak mendapatkan asupan gizi yang cukup dan sehat, serta menciptakan lingkungan yang mendukung pertumbuhan dan perkembangan anak. Artikel ini akan membahas tentang peran penting keluarga dalam mencegah stunting balita.',
    type: ArtikelType.informasi,
  ),

  // Penyebab
  ArtikelModel(
    id: '6',
    title: '5 Cara Mudah Mencegah Stunting pada Balita yang Perlu Anda Ketahui',
    imgPath: 'lib/images/artikel/artikel6.jpg',
    viewCount: '23',
    createdAt: DateTime(2023, 6, 11),
    content:
        'Mencegah stunting pada balita dapat dilakukan dengan cara yang sederhana namun efektif, seperti memberikan makanan bergizi dan memastikan pola makan yang seimbang. Artikel ini akan membahas tips-tips mudah untuk mencegah stunting pada balita.',
    type: ArtikelType.penyebab,
  ),
  ArtikelModel(
    id: '7',
    title: 'Pentingnya Peran Orang Tua dalam Pencegahan Stunting pada Balita',
    imgPath: 'lib/images/artikel/artikel7.jpg',
    viewCount: '61',
    createdAt: DateTime(2023, 7, 08),
    content:
        'Orang tua memiliki peran yang sangat penting dalam mencegah stunting pada balita. Artikel ini akan membahas cara orang tua dapat membantu anak-anaknya tumbuh sehat dan terhindar dari stunting.',
    type: ArtikelType.penyebab,
  ),
  ArtikelModel(
    id: '8',
    title: 'Program Pemerintah untuk Mencegah Stunting pada Balita: Apa Saja?',
    imgPath: 'lib/images/artikel/artikel8.jpg',
    viewCount: '46',
    createdAt: DateTime(2023, 8, 25),
    content:
        'Pemerintah telah mengeluarkan berbagai program untuk mencegah stunting pada balita, mulai dari pemberian makanan bergizi hingga program kesehatan ibu dan anak. Artikel ini akan membahas program-program tersebut dan bagaimana cara mengaksesnya.',
    type: ArtikelType.penyebab,
  ),
  ArtikelModel(
    id: '9',
    title: '5 Cara Mudah untuk Mencegah Stunting pada Balita di Rumah',
    imgPath: 'lib/images/artikel/artikel9.jpg',
    viewCount: '88',
    createdAt: DateTime(2023, 9, 14),
    content:
        'Mencegah stunting pada balita bisa dilakukan dengan mudah di rumah. Artikel ini akan memberikan informasi tentang lima cara mudah untuk mencegah stunting pada balita, seperti memberikan makanan bergizi, meningkatkan pola hidup sehat, serta memberikan asupan gizi tambahan yang dibutuhkan.',
    type: ArtikelType.penyebab,
  ),
];
