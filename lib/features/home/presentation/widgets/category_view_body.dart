import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/category_cubit/category_cubit.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/category_cubit/category_states.dart';
import 'package:shopping_app/features/home/presentation/widgets/category_item.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      builder: (context, state) {
        if(state is FetchCategorySuccess) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryItem(
                categoryEntity: state.categories[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: state.categories.length,
          );
        }else if(state is FetchCategoryFailure) {
          return Center(
            child: Text(
              state.errorMessage,
            ),
          );
        }else {
          return const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        }
      },
    );
  }
}
