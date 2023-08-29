import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/navigate_to_details.dart';
import 'package:shopping_app/core/widgets/custom_cached_network_image.dart';
import 'package:shopping_app/core/widgets/handle_cart_icon.dart';
import 'package:shopping_app/core/widgets/handle_favourite.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/presentation/widgets/discount_and_name_book.dart';

class SingleCategoryGridViewItem extends StatelessWidget {
  final ProductEntity productEntity;

  const SingleCategoryGridViewItem({Key? key, required this.productEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToDetails(
          context,
          id: productEntity.id,
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
                    productEntity: productEntity,
                  ),
                  HandleCartIcon(
                    productEntity: productEntity,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: CustomCachedNetworkImage(
                    image: productEntity.image,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DiscountAndNameBook(
                productEntity: productEntity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
