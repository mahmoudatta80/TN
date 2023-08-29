// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductEntityAdapter extends TypeAdapter<ProductEntity> {
  @override
  final int typeId = 0;

  @override
  ProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductEntity(
      name: fields[0] as String,
      image: fields[1] as String,
      id: fields[3] as int,
      price: fields[2] as num,
      newPrice: fields[4] as num?,
      discount: fields[5] as num?,
      productDetails: fields[6] as String,
      shippingDetails: fields[7] as String,
      rating: fields[8] as num,
      isFavourite: fields[9] as bool,
      isCart: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ProductEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.newPrice)
      ..writeByte(5)
      ..write(obj.discount)
      ..writeByte(6)
      ..write(obj.productDetails)
      ..writeByte(7)
      ..write(obj.shippingDetails)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.isFavourite)
      ..writeByte(10)
      ..write(obj.isCart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
