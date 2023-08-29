import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

class CartItemDetails extends StatelessWidget {
  final ProductEntity productEntity;

  const CartItemDetails({Key? key, required this.productEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productEntity.name,
            style: Styles.text13.copyWith(
              color: kPrimaryColor,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (cartCubit.countOrProduct[productEntity.id]! > 1) {
                    cartCubit
                      ..minusFromPrice(
                        productEntity.newPrice ?? productEntity.price,
                      )
                      ..minusFromCountOfProduct(productEntity);
                  }
                },
                child: const FaIcon(
                  FontAwesomeIcons.squareMinus,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${cartCubit.countOrProduct[productEntity.id]}',
                style: Styles.text16.copyWith(
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  if (cartCubit.countOrProduct[productEntity.id]! < 20) {
                    cartCubit
                      ..addToPrice(
                        productEntity.newPrice ?? productEntity.price,
                      )
                      ..addToCountOfProduct(productEntity);
                  }
                },
                child: const FaIcon(
                  FontAwesomeIcons.squarePlus,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
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
        ],
      ),
    );
  }
}
