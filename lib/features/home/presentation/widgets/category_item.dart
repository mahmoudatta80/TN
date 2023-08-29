import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';
import 'package:shopping_app/features/home/presentation/manager/functions/navigate_to_single_category.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const CategoryItem({Key? key, required this.categoryEntity})
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
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kThirdColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: CachedNetworkImage(
              imageUrl: categoryEntity.image,
              progressIndicatorBuilder: (context, url, progress) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              },
              errorWidget: (context, url, error) => const Center(
                child: Icon(
                  Icons.error_outline,
                ),
              ),
            ),
          ),
          title: Text(
            categoryEntity.title,
            style: Styles.text18,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: kPrimaryColor.withOpacity(.75),
          ),
        ),
      ),
    );
  }
}
