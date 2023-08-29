import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_states.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

class CartCount extends StatelessWidget {
  final ProductEntity productEntity;

  const CartCount({Key? key, required this.productEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                if (cartCubit.cartCount > 1) {
                  cartCubit.minusFromCartCount();
                }
              },
              child: const FaIcon(
                FontAwesomeIcons.squareMinus,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${cartCubit.countOrProduct[productEntity.id] ?? cartCubit.cartCount}',
              style: Styles.text20.copyWith(
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                if (cartCubit.cartCount < 20) {
                  cartCubit.addToCartCount();
                }
              },
              child: const FaIcon(
                FontAwesomeIcons.squarePlus,
                color: kPrimaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
