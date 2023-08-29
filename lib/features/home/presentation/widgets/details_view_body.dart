import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/widgets/custom_cached_network_image.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/presentation/widgets/book_review.dart';
import 'package:shopping_app/features/home/presentation/widgets/details_field.dart';
import 'package:shopping_app/features/home/presentation/widgets/name_and_price.dart';

class DetailsViewBody extends StatelessWidget {
  final ProductEntity productEntity;
  const DetailsViewBody({Key? key, required this.productEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: kSecondaryColor.withOpacity(.7),
            ),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.35,
          child: CustomCachedNetworkImage(
            image: productEntity.image,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productEntity.name, style: Styles.text18),
              OldAndNewPrice(
                productEntity: productEntity,
              ),
              const SizedBox(height: 10),
              Divider(
                thickness: 1.5,
                color: kSecondaryColor.withOpacity(.5),
                endIndent: 20,
                indent: 20,
              ),
              DetailsField(
                title: getLang(context, 'Product details'),
                details: productEntity.productDetails,
              ),
              DetailsField(
                title: getLang(context, 'shipping details'),
                details: productEntity.productDetails,
              ),
              DetailsField(
                title: getLang(context, 'Return Policy'),
                details: productEntity.productDetails,
              ),
              const BookReview(),
            ],
          ),
        ),
      ],
    );
  }
}
