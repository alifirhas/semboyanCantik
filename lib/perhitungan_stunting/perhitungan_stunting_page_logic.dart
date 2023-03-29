import 'package:startertemplate/data/child_growth_standard_repository.dart';
import 'package:flutter/material.dart';
import 'package:startertemplate/models/child_growth_standard_model.dart';

class PerhitunganStuntingPageLogic {
  Map<String, dynamic> formValidateUmur(
    int umurTahun,
    int umurBulan,
    String gender,
  ) {
    Map<String, dynamic> hasil = {
      "status": true,
      "message": 'tidak ada masalah'
    };
    // Ubah umur ke bulan
    int umur = convertUmurKeBulan(umurTahun, umurBulan);

    // Validate umur tidak lebih dari dua tahun
    if (umur > 24) {
      return hasil = {
        "status": false,
        "message": "Umur balita sudah melebihi dua tahun",
      };
    }

    // Validate umur ada di Child Growth Standard
    if (convertUmurKeBulan(umurTahun, umurBulan) <= 24) {
      // Akses data child growth standard
      List<ChildGrowthStandardContainer> cdsData = childGrowthStandard;
      List<ChildGrowthStandardModel> cdsBalita;

      // Ambil child growth berdasarkan gender
      if (gender == 'boy') {
        cdsBalita =
            cdsData[0].data.where((element) => element.month == umur).toList();
      } else {
        cdsBalita =
            cdsData[0].data.where((element) => element.month == umur).toList();
      }

      // Validasi data ada atau tidak
      if (cdsBalita.isEmpty) {
        return hasil = {
          "status": false,
          "message": "Umur balita masih belum dicakup oleh sistem",
        };
      }
    }

    return hasil;
  }

  int convertUmurKeBulan(int umurTahun, int umurBulan) {
    int umur = (umurTahun * 12) + umurBulan;
    debugPrint("Umur $umur");
    return umur;
  }

  double hitungZScore(
    double tinggiBadan,
    int umurTahun,
    int umurBulan,
    String gender,
  ) {
    double zScore = 0;
    int umur = 0;
    double median = 0;
    double standarDeviasi = 0;
    ChildGrowthStandardModel cdsBalita = ChildGrowthStandardModel(
      month: 0,
      l: 0,
      m: 0,
      s: 0,
      sd: 0,
      sd3neg: 0,
      sd2neg: 0,
      sd1neg: 0,
      sd0: 0,
      sd1: 0,
      sd2: 0,
      sd3: 0,
    );
    int genderIndex = 0;

    debugPrint("tinggiBadan $tinggiBadan");
    debugPrint("umurTahun $umurTahun");
    debugPrint("umurBulan $umurBulan");
    debugPrint("gender $gender");

    // Akses data child growth standard
    List<ChildGrowthStandardContainer> cdsData = childGrowthStandard;
    List<ChildGrowthStandardModel> cdsDataTemp;

    // Ubah umur ke bulan
    umur += convertUmurKeBulan(umurTahun, umurBulan);

    // Ambil child growth berdasarkan gender
    if (gender == 'boy') {
      genderIndex = 0;
    } else {
      genderIndex = 1;
    }

    cdsDataTemp = cdsData[genderIndex]
        .data
        .where((element) => element.month == umur)
        .toList();

    if (cdsDataTemp.isNotEmpty) {
      cdsBalita =
          cdsData[0].data.where((element) => element.month == umur).first;
    }

    // Ambil child growth standard median dan Standar Deviasi
    median = cdsBalita.m;
    standarDeviasi = cdsBalita.sd;

    zScore = (tinggiBadan - median) / standarDeviasi;
    debugPrint("median $median");
    debugPrint("standarDeviasi $standarDeviasi");
    debugPrint("zScore $zScore");

    return zScore;
  }

  String transkripsiStatusZScore(double zScore) {
    String hasil = '';

    if (zScore.isInfinite) {
      hasil =
          'Pertumbuhan balita sungguh luar biasa dan tak terhingga, melebihi batasan hitungan teknologi kita, mereka adalah mukjizat kehidupan yang sungguh mengagumkan!';
    } else if (zScore < -3) {
      hasil =
          "Balita memiliki gangguan pertumbuhan yang parah atau stunting berat";
    } else if (zScore >= -3 && zScore < -2) {
      hasil = 'Balita memiliki gangguan pertumbuhan atau stunting';
    } else if (zScore >= -2 && zScore < 2) {
      hasil = 'Balita memiliki pertumbuhan normal atau sehat';
    } else if (zScore >= 2 && zScore < 3) {
      hasil =
          'Balita memiliki pertumbuhan lebih tinggi dari rata-rata atau di atas normal';
    } else if (zScore >= 3) {
      hasil = 'Balita memiliki pertumbuhan yang sangat tinggi atau gigantisme';
    }

    return hasil;
  }
}
