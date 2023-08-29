import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/presentation/widgets/cart_count.dart';

class OldAndNewPrice extends StatelessWidget {
  final ProductEntity productEntity;

  const OldAndNewPrice({Key? key, required this.productEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${productEntity.price} \$',
          style: Styles.text16.copyWith(
            color: productEntity.discount == 0
                ? kPrimaryColor
                : kPrimaryColor.withOpacity(0.75),
            decoration: productEntity.discount == 0
                ? TextDecoration.none
                : TextDecoration.lineThrough,
            decorationThickness: 1.5,
          ),
        ),
        const SizedBox(width: 10),
        productEntity.discount != 0
            ? Text(
                '${productEntity.newPrice} \$',
                style: Styles.text18.copyWith(
                  color: kPrimaryColor,
                ),
              )
            : Container(),
        const Spacer(),
        CartCount(
          productEntity: productEntity,
        ),
      ],
    );
  }
}
