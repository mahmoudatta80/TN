import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/widgets/custom_error.dart';
import 'package:shopping_app/core/widgets/custom_grid_view_loading.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/single_category_cubit/single_category_cubit.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/single_category_cubit/single_category_states.dart';
import 'single_category_grid_view_item.dart';

class SingleCategoryGridView extends StatelessWidget {
  const SingleCategoryGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleCategoryCubit, SingleCategoryStates>(
      builder: (context, state) {
        if (state is FetchSingleCategorySuccess) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 15,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.35),
            itemBuilder: (context, index) {
              return SingleCategoryGridViewItem(
                productEntity: state.productEntity[index],
              );
            },
            itemCount: state.productEntity.length,
          );
        } else if (state is FetchSingleCategoryFailure) {
          return CustomError(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomGridViewLoading();
        }
      },
    );
  }
}
