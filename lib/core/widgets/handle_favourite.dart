import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/favourite_cubit/favourite_states.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_favourite_cubit/update_favourite_cubit.dart';

class HandleFavourite extends StatelessWidget {
  final ProductEntity productEntity;
  final double? size;

  const HandleFavourite({Key? key, required this.productEntity, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<FavouriteCubit>(context);
        if (cubit.isFavourite[productEntity.id] ?? false) {
          return IconButton(
            onPressed: () {
              cubit.deleteFromFavourite(productEntity);
              BlocProvider.of<UpdateFavouriteCubit>(context)
                  .updateFavourite(productEntity.id);
            },
            icon: FaIcon(
              FontAwesomeIcons.solidBookmark,
              size: size ?? 20,
              color: kPrimaryColor,
            ),
          );
        } else {
          return IconButton(
            onPressed: () {
              cubit.addToFavourite(productEntity);
              BlocProvider.of<UpdateFavouriteCubit>(context)
                  .updateFavourite(productEntity.id);
            },
            icon: FaIcon(
              FontAwesomeIcons.bookmark,
              size: size ?? 20,
              color: kPrimaryColor,
            ),
          );
        }
      },
    );
  }
}
