import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/favourite_cubit/favourite_states.dart';
import 'package:shopping_app/features/profile/presentation/widgets/favourite_item.dart';
import 'package:shopping_app/features/profile/presentation/widgets/impty_favourite.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: BlocBuilder<FavouriteCubit, FavouriteStates>(
        builder: (context, state) {
          FavouriteCubit favouriteCubit = BlocProvider.of<FavouriteCubit>(context);
          if(favouriteCubit.favourites.isEmpty) {
            return const ImptyFavourite();
          }
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 15,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.35
            ),
            itemBuilder: (context, index) {
                return FavouriteItem(
                  productEntity: favouriteCubit.favourites.values.toList()[index],
                );
            },
            itemCount: favouriteCubit.favourites.length,
          );
        },
      ),
    );
  }
}
