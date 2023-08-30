import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/navigate_to_details.dart';
import 'package:shopping_app/core/widgets/custom_cached_network_image.dart';
import 'package:shopping_app/core/widgets/handle_cart_icon.dart';
import 'package:shopping_app/core/widgets/handle_favourite.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/search/domain/entities/search_entity.dart';
import 'package:shopping_app/features/search/presentation/widgets/discount_and_name.dart';

class SearchGridViewItem extends StatelessWidget {
  final SearchEntity searchEntity;

  const SearchGridViewItem({Key? key, required this.searchEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToDetails(
          context,
          id: searchEntity.id,
        );
      },
      child: Card(
        color: kThirdColor,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HandleFavourite(
                    productEntity: ProductEntity(
                      name: searchEntity.name,
                      image: searchEntity.image,
                      id: searchEntity.id,
                      price: searchEntity.price,
                      discount: 0,
                      productDetails: searchEntity.productDetails,
                      shippingDetails: searchEntity.shippingDetails,
                      rating: searchEntity.rating,
                      isFavourite: searchEntity.isFavourite,
                      isCart: searchEntity.isCart,
                    ),
                  ),
                  HandleCartIcon(
                    productEntity: ProductEntity(
                      name: searchEntity.name,
                      image: searchEntity.image,
                      id: searchEntity.id,
                      price: searchEntity.price,
                      discount: 0,
                      productDetails: searchEntity.productDetails,
                      shippingDetails: searchEntity.shippingDetails,
                      rating: searchEntity.rating,
                      isFavourite: searchEntity.isFavourite,
                      isCart: searchEntity.isCart,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: CustomCachedNetworkImage(
                    image: searchEntity.image,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DiscountAndName(
                searchEntity: searchEntity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
