import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/widgets/custom_cached_network_image.dart';
import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';
import 'package:shopping_app/features/home/presentation/manager/functions/navigate_to_single_category.dart';

class CategoryListViewItem extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const CategoryListViewItem({Key? key, required this.categoryEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToSingleCategory(
          context,
          title: categoryEntity.title,
          id: categoryEntity.id,
        );
      },
      child: Card(
        color: kThirdColor,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCachedNetworkImage(
                image: categoryEntity.image,
                height: 35,
              ),
              Text(
                categoryEntity.title,
                style: Styles.text13.copyWith(
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
