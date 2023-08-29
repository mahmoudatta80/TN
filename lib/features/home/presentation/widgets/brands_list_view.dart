import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/widgets/brands_list_view_item.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 25,
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const BrandsListViewItem();
          },
          itemCount: 6,
        ),
      ),
    );
  }
}
