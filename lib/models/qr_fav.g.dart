// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_fav.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QrFavAdapter extends TypeAdapter<QrFav> {
  @override
  final int typeId = 2;

  @override
  QrFav read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QrFav(
      rawValue: fields[1] as String,
      type: fields[2] as String,
      id: fields[0] as String,
      createdAt: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, QrFav obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.rawValue)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QrFavAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
