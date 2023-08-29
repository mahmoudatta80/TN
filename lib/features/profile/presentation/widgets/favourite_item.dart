import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/navigate_to_details.dart';
import 'package:shopping_app/core/widgets/custom_cached_network_image.dart';
import 'package:shopping_app/core/widgets/handle_cart_icon.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/presentation/widgets/discount_and_name_book.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_favourite_cubit/update_favourite_cubit.dart';

class FavouriteItem extends StatelessWidget {
  final ProductEntity productEntity;

  const FavouriteItem({Key? key, required this.productEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToDetails(
          context,
          id: productEntity.id,
        );
      },
      child: Card(
        color: kThirdColor,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<FavouriteCubit>(context)
                          .deleteFromFavourite(productEntity);
                      BlocProvider.of<UpdateFavouriteCubit>(context)
                          .updateFavourite(productEntity.id);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.solidBookmark,
                      size: 20,
                      color: kPrimaryColor,
                    ),
                  ),
                  HandleCartIcon(
                    productEntity: productEntity,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: CustomCachedNetworkImage(
                    image: productEntity.image,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DiscountAndNameBook(
                productEntity: productEntity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
