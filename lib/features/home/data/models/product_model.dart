import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

class ProductModel extends ProductEntity {
  late final String productName;
  late final String productImage;
  late final num productOldPrice;
  late final int productId;
  num? productPriceAfterDiscount;
  num? productDiscount;
  late final String detailsOfProduct;
  late final String detailsOfShipping;
  late final num productRating;
  late final bool inFavourite;
  late final bool inCart;

  ProductModel({
    required this.productName,
    required this.productImage,
    required this.productOldPrice,
    required this.productId,
    this.productPriceAfterDiscount,
    this.productDiscount,
    required this.detailsOfProduct,
    required this.detailsOfShipping,
    required this.productRating,
    required this.inFavourite,
    required this.inCart,
  }) : super(
          name: productName,
          image: productImage,
          id: productId,
          rating: productRating,
          discount: productDiscount,
          price: productOldPrice,
          productDetails: detailsOfProduct,
          shippingDetails: detailsOfShipping,
          newPrice: productPriceAfterDiscount,
          isFavourite: inFavourite,
          isCart: inCart,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productPriceAfterDiscount: json['price'] ?? json['oldPrice'],
      productName: json['name'],
      productId: json['id'],
      productImage: json['image'],
      productOldPrice: json['old_price'],
      productDiscount: json['discount'] ?? 0,
      detailsOfProduct: json['description'],
      detailsOfShipping: json['description'],
      productRating: json['productRating'] ?? 4.3,
      inFavourite: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
