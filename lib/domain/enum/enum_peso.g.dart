// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_peso.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusPesoAdapter extends TypeAdapter<StatusPeso> {
  @override
  final int typeId = 1;

  @override
  StatusPeso read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return StatusPeso.MUITO_BAIXO_PESO;
      case 2:
        return StatusPeso.BAIXO_PESO;
      case 3:
        return StatusPeso.NORMAL;
      case 4:
        return StatusPeso.ACIMA_DO_PESO;
      case 5:
        return StatusPeso.OBESIDADE_I;
      case 6:
        return StatusPeso.OBESIDADE_II;
      case 7:
        return StatusPeso.OBESIDADE_III;
      default:
        return StatusPeso.MUITO_BAIXO_PESO;
    }
  }

  @override
  void write(BinaryWriter writer, StatusPeso obj) {
    switch (obj) {
      case StatusPeso.MUITO_BAIXO_PESO:
        writer.writeByte(1);
        break;
      case StatusPeso.BAIXO_PESO:
        writer.writeByte(2);
        break;
      case StatusPeso.NORMAL:
        writer.writeByte(3);
        break;
      case StatusPeso.ACIMA_DO_PESO:
        writer.writeByte(4);
        break;
      case StatusPeso.OBESIDADE_I:
        writer.writeByte(5);
        break;
      case StatusPeso.OBESIDADE_II:
        writer.writeByte(6);
        break;
      case StatusPeso.OBESIDADE_III:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusPesoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
