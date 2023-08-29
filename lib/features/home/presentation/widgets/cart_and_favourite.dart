import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/widgets/handle_cart_button.dart';
import 'package:shopping_app/core/widgets/handle_favourite.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

class CartAndFavourite extends StatelessWidget {
  final ProductEntity productEntity;
  const CartAndFavourite({Key? key, required this.productEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kThirdColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        children: [
          HandleFavourite(
            productEntity: productEntity,
            size: 26,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: HandleCartButton(
              productEntity: productEntity,
            ),
          ),
        ],
      ),
    );
  }
}
