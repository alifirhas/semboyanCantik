// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jejak_stunting_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JejakStuntingAdapter extends TypeAdapter<JejakStunting> {
  @override
  final int typeId = 1;

  @override
  JejakStunting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JejakStunting(
      id: fields[0] as String,
      createdDate: fields[1] as DateTime,
      zScore: fields[2] as double,
      statusStunting: fields[3] as String,
      umur: fields[4] as int,
      tinggiBadan: fields[5] as double,
      jenisKelamin: fields[6] as String,
      namaBaduta: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JejakStunting obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdDate)
      ..writeByte(2)
      ..write(obj.zScore)
      ..writeByte(3)
      ..write(obj.statusStunting)
      ..writeByte(4)
      ..write(obj.umur)
      ..writeByte(5)
      ..write(obj.tinggiBadan)
      ..writeByte(6)
      ..write(obj.jenisKelamin)
      ..writeByte(7)
      ..write(obj.namaBaduta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JejakStuntingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
