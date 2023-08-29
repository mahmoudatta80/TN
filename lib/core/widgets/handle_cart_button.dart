import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_states.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/update_cart_cubit/update_cart_cubit.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

class HandleCartButton extends StatelessWidget {
  final ProductEntity productEntity;

  const HandleCartButton({Key? key, required this.productEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
        if (cartCubit.isCart[productEntity.id] ?? false) {
          return CustomButton(
            color: Colors.white,
            text: getLang(context, 'Delete from cart'),
            onPressed: () {
              BlocProvider.of<UpdateCartCubit>(context)
                  .updateCart(productEntity.id);
              cartCubit.deleteFromCart(productEntity);
            },
          );
        } else {
          return CustomButton(
            text: getLang(context, 'Add to cart'),
            onPressed: () async {
              BlocProvider.of<UpdateCartCubit>(context)
                  .updateCart(productEntity.id);
              await cartCubit.addToCart(
                productEntity,
                cartCubit.cartCount.toInt(),
              );
              cartCubit.cartCount = 1;
            },
          );
        }
      },
    );
  }
}
