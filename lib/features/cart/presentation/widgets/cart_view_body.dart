import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/presentation/widgets/cart_list_view.dart';

class CartViewBody extends StatelessWidget {
  final CartCubit cartCubit;
  const CartViewBody({Key? key, required this.cartCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartListView(
            cartCubit: cartCubit,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                getLang(context, 'Total Price :'),
                style: Styles.text16.copyWith(
                  color: kPrimaryColor.withOpacity(
                    .75,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Text('${cartCubit.totalCartPrice} \$', style: Styles.text18),
            ],
          ),
          Row(
            children: [
              Text(
                getLang(context, 'Delivery fees :'),
                style: Styles.text16.copyWith(
                  color: kPrimaryColor.withOpacity(
                    .75,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Text(getLang(context, '10'), style: Styles.text18),
            ],
          ),
          Row(
            children: [
              Text(
                getLang(context, 'Have a coupon ?'),
                style: Styles.text16.copyWith(
                  color: kPrimaryColor.withOpacity(
                    .75,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              const FaIcon(
                FontAwesomeIcons.ticket,
                color: kPrimaryColor,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
