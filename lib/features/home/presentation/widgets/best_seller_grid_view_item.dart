import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/navigate_to_details.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/widgets/custom_cached_network_image.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/presentation/widgets/discount_and_name_book.dart';

class BestSellerGridViewItem extends StatelessWidget {
  final ProductEntity productEntity;

  const BestSellerGridViewItem({Key? key, required this.productEntity})
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
              productEntity.discount != 0
                  ? Text(
                      '${productEntity.discount}%',
                      style: Styles.text13.copyWith(
                        color: kErrorColor,
                      ),
                    )
                  : Container(),
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
