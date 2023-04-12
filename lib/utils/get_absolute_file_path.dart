import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> getAbsoluteFilePath(String filename) async {
  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  String appDocumentsPath = appDocumentsDirectory.path;
  return '$appDocumentsPath/$filename';
}
