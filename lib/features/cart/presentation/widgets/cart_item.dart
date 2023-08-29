import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/navigate_to_details.dart';
import 'package:shopping_app/core/widgets/custom_cached_network_image.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/update_cart_cubit/update_cart_cubit.dart';
import 'package:shopping_app/features/cart/presentation/widgets/cart_item_details.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

class CartItem extends StatelessWidget {
  final ProductEntity productEntity;

  const CartItem({Key? key, required this.productEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToDetails(
          context,
          id: productEntity.id,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 15,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: kPrimaryColor.withOpacity(.25),
          ),
          color: kThirdColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CustomCachedNetworkImage(
                    image: productEntity.image,
                  ),
                ),
              ),
            ),
            CartItemDetails(
              productEntity: productEntity,
            ),
            FloatingActionButton(
              backgroundColor: kThirdColor,
              elevation: 0,
              onPressed: () {
                BlocProvider.of<CartCubit>(context)
                    .deleteFromCart(productEntity);
                BlocProvider.of<UpdateCartCubit>(context)
                    .updateCart(productEntity.id);
              },
              child: const FaIcon(
                FontAwesomeIcons.circleXmark,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
