import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

class DiscountAndNameBook extends StatelessWidget {
  final ProductEntity productEntity;

  const DiscountAndNameBook({Key? key, required this.productEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${productEntity.price} \$',
              style: Styles.text13.copyWith(
                color: productEntity.discount == 0
                    ? kPrimaryColor
                    : kPrimaryColor.withOpacity(.5),
                decoration: productEntity.discount == 0
                    ? TextDecoration.none
                    : TextDecoration.lineThrough,
                decorationThickness: 1.5,
              ),
            ),
            const SizedBox(width: 8),
            productEntity.discount != 0
                ? Text(
                    '${productEntity.newPrice} \$',
                    style: Styles.text13.copyWith(
                      color: kPrimaryColor,
                    ),
                  )
                : Container(),
          ],
        ),
        Text(
          productEntity.name,
          style: Styles.text13,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
