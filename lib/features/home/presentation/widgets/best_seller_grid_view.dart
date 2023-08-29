import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/widgets/custom_grid_view_loading.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/best_seller_cubit/best_seller_cubit.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/best_seller_cubit/best_seller_states.dart';
import 'package:shopping_app/features/home/presentation/manager/functions/fill_cart.dart';
import 'package:shopping_app/features/home/presentation/manager/functions/fill_favourite.dart';
import 'package:shopping_app/features/home/presentation/widgets/best_seller_grid_view_item.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/favourite_cubit/favourite_cubit.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      child: BlocConsumer<BestSellerCubit, BestSellerStates>(
        listener: (context, state) {
          FavouriteCubit favouriteCubit =
              BlocProvider.of<FavouriteCubit>(context);
          CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
          if (state is FetchBestSellerSuccess) {
            fillFavourite(
              favouriteCubit: favouriteCubit,
              state: state,
            );
            fillCart(
              cartCubit: cartCubit,
              state: state,
            );
          }
        },
        builder: (context, state) {
          if (state is FetchBestSellerSuccess) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.35),
              itemBuilder: (context, index) {
                return BestSellerGridViewItem(
                  productEntity: state.products[index],
                );
              },
              itemCount: state.products.length,
            );
          } else if (state is FetchBestSellerFailure) {
            return Text(
              state.errorMessage,
            );
          } else {
            return const CustomGridViewLoading(
              shrinkWrap: true,
            );
          }
        },
      ),
    );
  }
}
