import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/widgets/custom_list_view_loading.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/category_cubit/category_cubit.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/category_cubit/category_states.dart';
import 'package:shopping_app/features/home/presentation/widgets/category_list_view_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 25,
        ),
        child: BlocBuilder<CategoryCubit, CategoryStates>(
          builder: (context, state) {
            if (state is FetchCategorySuccess) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryListViewItem(
                    categoryEntity: state.categories[index],
                  );
                },
                itemCount: state.categories.length,
              );
            } else if (state is FetchCategoryFailure) {
              return Text(
                state.errorMessage,
              );
            } else {
              return CustomListViewLoading(
                builder: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: const Card(
                    color: kThirdColor,
                    elevation: 5,
                  ),
                ),
                axis: Axis.horizontal,
                separated: const SizedBox(width: 15),
              );
            }
          },
        ),
      ),
    );
  }
}
