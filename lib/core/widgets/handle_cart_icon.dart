import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_states.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/update_cart_cubit/update_cart_cubit.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

class HandleCartIcon extends StatelessWidget {
  final ProductEntity productEntity;

  const HandleCartIcon({Key? key, required this.productEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
        if (cartCubit.isCart[productEntity.id] ?? false) {
          return IconButton(
            onPressed: () {
              cartCubit.deleteFromCart(productEntity);
              BlocProvider.of<UpdateCartCubit>(context)
                  .updateCart(productEntity.id);
            },
            icon: const FaIcon(
              FontAwesomeIcons.solidSquarePlus,
              size: 20,
              color: kPrimaryColor,
            ),
          );
        } else {
          return IconButton(
            onPressed: () {
              cartCubit.addToCart(productEntity, 1);
              BlocProvider.of<UpdateCartCubit>(context)
                  .updateCart(productEntity.id);
            },
            icon: const FaIcon(
              FontAwesomeIcons.squarePlus,
              size: 20,
              color: kPrimaryColor,
            ),
          );
        }
      },
    );
  }
}
