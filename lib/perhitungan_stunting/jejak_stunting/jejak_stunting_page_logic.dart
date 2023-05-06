import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class JejakStuntingPageLogic {
  List<dynamic> getJejakStuntingList() {
    final jejakStuntingBox = Hive.box('jejakStuntingBox');
    List<dynamic> jejakStuntingList = jejakStuntingBox.values.toList();

    jejakStuntingList.sort((a, b) => b.createdDate.compareTo(a.createdDate));

    return jejakStuntingList;
  }

  void deleteJejakStunting(String id) {
    final jejakStuntingBox = Hive.box('jejakStuntingBox');
    jejakStuntingBox.delete(id);

    debugPrint('deleted');
  }
}
