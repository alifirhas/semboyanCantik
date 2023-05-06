import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class JejakStuntingPageLogic {
  List<dynamic> getJejakStuntingList() {
    final jejakStuntingList = Hive.box('jejakStuntingBox');
    inspect(jejakStuntingList.values.toList());
    return jejakStuntingList.values.toList();
  }

  void deleteJejakStunting(String id) {
    final jejakStuntingBox = Hive.box('jejakStuntingBox');
    // final jejakStunting =
    //     jejakStuntingBox.values.firstWhere((element) => element.id == id);
    // jejakStunting;
    jejakStuntingBox.delete(id);

    debugPrint('deleted');
  }
}
