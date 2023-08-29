import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/core/widgets/custom_error.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/product_details_cubit/product_details_cubit.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/product_details_cubit/product_details_states.dart';
import 'package:shopping_app/features/home/presentation/widgets/cart_and_favourite.dart';
import 'package:shopping_app/features/home/presentation/widgets/details_view_app_bar.dart';
import 'package:shopping_app/features/home/presentation/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
          builder: (context, state) {
            if (state is FetchProductDetailsSuccess) {
              return Column(
                children: [
                  const DetailsViewAppBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: DetailsViewBody(
                        productEntity: state.productEntity,
                      ),
                    ),
                  ),
                  CartAndFavourite(
                    productEntity: state.productEntity,
                  ),
                ],
              );
            } else if (state is FetchProductDetailsFailure) {
              return CustomError(
                errorMessage: state.errorMessage,
              );
            } else {
              return Center(
                child: Lottie.asset(
                  'assets/lottie/loading.json',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
