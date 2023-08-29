import 'package:shopping_app/features/search/domain/entities/search_entity.dart';

class SearchModel extends SearchEntity {
  late final String productName;
  late final String imageUrl;
  late final num oldPrice;
  late final int productId;
  late final String detailsOfProduct;
  late final String detailsOfShipping;
  late final num productRating;
  late final bool inFavourite;
  late final bool inCart;

  SearchModel({
    required this.productName,
    required this.imageUrl,
    required this.oldPrice,
    required this.productId,
    required this.detailsOfProduct,
    required this.detailsOfShipping,
    required this.productRating,
    required this.inFavourite,
    required this.inCart,
  }) : super(
    name: productName,
    image: imageUrl,
    id: productId,
    rating: productRating,
    price: oldPrice,
    productDetails: detailsOfProduct,
    shippingDetails: detailsOfShipping,
    isFavourite: inFavourite,
    isCart: inCart,
  );

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      productName: json['name'],
      productId: json['id'],
      imageUrl: json['image'],
      oldPrice: json['price'],
      detailsOfProduct: json['description'],
      detailsOfShipping: json['description'],
      productRating: json['productRating'] ?? 4.3,
      inFavourite: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
