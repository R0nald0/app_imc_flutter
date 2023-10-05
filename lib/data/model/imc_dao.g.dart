// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcDaoAdapter extends TypeAdapter<ImcDao> {
  @override
  final int typeId = 0;

  @override
  ImcDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImcDao(
      fields[1] as String,
      fields[2] as double,
      fields[3] as Enum,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImcDao obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj.imc)
      ..writeByte(3)
      ..write(obj._statusWeight)
      ..writeByte(4)
      ..write(obj._date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
