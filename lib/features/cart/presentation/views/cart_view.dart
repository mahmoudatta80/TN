import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_states.dart';
import 'package:shopping_app/features/cart/presentation/widgets/cart_view_app_bar.dart';
import 'package:shopping_app/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:shopping_app/features/cart/presentation/widgets/check_out.dart';
import 'package:shopping_app/features/cart/presentation/widgets/impty_cart.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CartViewAppBar(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<CartCubit, CartStates>(
              builder: (context, state) {
                CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
                if(cartCubit.carts.isEmpty) {
                  return const ImptyCart();
                }
                return Column(
                  children: [
                    CartViewBody(
                      cartCubit: cartCubit,
                    ),
                    CheckOut(
                      cartCubit: cartCubit,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
