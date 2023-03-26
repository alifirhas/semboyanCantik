import 'package:startertemplate/models/artikel_model.dart';
import 'package:flutter/material.dart';

class ArtikelPageLogic {
  List<ArtikelModel> getArtikelByType(
      List<ArtikelModel> listData, ArtikelType type) {
    List<ArtikelModel> filteredArtikel =
        listData.where((element) => element.type == type).toList();

    debugPrint(filteredArtikel.length.toString());

    return filteredArtikel;
  }

  List<ArtikelModel> artikelPopuler(List<ArtikelModel> listData) {
    // Urutkan dari viewcount desc
    listData.sort((a, b) => b.viewCount.compareTo(a.viewCount));

    // Ambil 3 artikel terbesar
    List<ArtikelModel> dataPopuler = listData.take(3).toList();

    return dataPopuler;
  }

  List<ArtikelModel> artikelSortId(List<ArtikelModel> listData) {
    // Urutkan dari viewcount desc
    listData.sort((a, b) => b.id.compareTo(a.id));

    return listData;
  }
}
