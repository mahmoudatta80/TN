import 'package:flutter/material.dart';
import 'package:shopping_app/features/search/domain/entities/search_entity.dart';
import 'package:shopping_app/features/search/presentation/widgets/search_grid_view_item.dart';

class SearchGridView extends StatelessWidget {
  final List<SearchEntity> searchedProduct;

  const SearchGridView({
    Key? key,
    required this.searchedProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 15,
          mainAxisExtent: MediaQuery.of(context).size.height * 0.35),
      itemBuilder: (context, index) {
        return SearchGridViewItem(
          searchEntity: searchedProduct[index],
        );
      },
      itemCount: searchedProduct.length,
    );
  }
}
