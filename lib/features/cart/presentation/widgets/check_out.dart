import 'package:flutter/material.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';

class CheckOut extends StatelessWidget {
  final CartCubit cartCubit;

  const CheckOut({Key? key, required this.cartCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getLang(context, 'Total :'),
                style: Styles.text18,
              ),
              Text(
                '${cartCubit.totalPrice + cartCubit.totalCartPrice} \$',
                style: Styles.text16WithOpacity,
              ),
            ],
          ),
          const SizedBox(height: 15),
          CustomButton(
            text: getLang(context, 'Check out'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
