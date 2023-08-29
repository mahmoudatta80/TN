class SearchEntity {
  late final String name;
  late final String image;
  late final num price;
  late final int id;
  late final String productDetails;
  late final String shippingDetails;
  late final num rating;
  late final bool isFavourite;
  late final bool isCart;

  SearchEntity({
    required this.name,
    required this.image,
    required this.id,
    required this.price,
    required this.productDetails,
    required this.shippingDetails,
    required this.rating,
    required this.isFavourite,
    required this.isCart,
  });
}
