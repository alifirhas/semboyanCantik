import 'package:hive/hive.dart';
part 'jejak_stunting_model.g.dart';

@HiveType(typeId: 1)
class JejakStunting {
  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime createdDate;

  @HiveField(2)
  double zScore;

  @HiveField(3)
  String statusStunting;

  @HiveField(4)
  int umur;

  @HiveField(5)
  double tinggiBadan;

  @HiveField(6)
  String jenisKelamin;

  @HiveField(7)
  String namaBaduta;

  JejakStunting({
    required this.id,
    required this.createdDate,
    required this.zScore,
    required this.statusStunting,
    required this.umur,
    required this.tinggiBadan,
    required this.jenisKelamin,
    required this.namaBaduta,
  });
}
