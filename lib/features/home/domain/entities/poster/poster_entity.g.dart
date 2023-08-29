// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PosterEntityAdapter extends TypeAdapter<PosterEntity> {
  @override
  final int typeId = 1;

  @override
  PosterEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PosterEntity(
      id: fields[0] as int,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PosterEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PosterEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
