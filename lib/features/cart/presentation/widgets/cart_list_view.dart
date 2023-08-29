import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/presentation/widgets/cart_item.dart';

class CartListView extends StatelessWidget {
  final CartCubit cartCubit;
  const CartListView({Key? key, required this.cartCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CartItem(
          productEntity: cartCubit.carts.values.toList()[index],
        );
      },
      itemCount: cartCubit.carts.values.toList().length,
    );
  }
}
