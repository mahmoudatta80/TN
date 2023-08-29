import 'package:hive_flutter/hive_flutter.dart';
import 'package:equatable/equatable.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity extends Equatable {
  @HiveField(0)
  late final String name;
  @HiveField(1)
  late final String image;
  @HiveField(2)
  late final num price;
  @HiveField(3)
  late final int id;
  @HiveField(4)
  num? newPrice;
  @HiveField(5)
  num? discount;
  @HiveField(6)
  late final String productDetails;
  @HiveField(7)
  late final String shippingDetails;
  @HiveField(8)
  late final num rating;
  @HiveField(9)
  late final bool isFavourite;
  @HiveField(10)
  late final bool isCart;

  ProductEntity({
    required this.name,
    required this.image,
    required this.id,
    required this.price,
    this.newPrice,
    this.discount,
    required this.productDetails,
    required this.shippingDetails,
    required this.rating,
    required this.isFavourite,
    required this.isCart,
  });

  @override
  List<Object?> get props => [
        name,
        image,
        id,
        price,
        newPrice,
        discount,
        productDetails,
        shippingDetails,
        rating,
        isFavourite,
        isCart
      ];
}
