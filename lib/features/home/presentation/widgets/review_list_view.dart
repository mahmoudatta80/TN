import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/home/presentation/widgets/review_item.dart';

class ReviewListView extends StatelessWidget {
  const ReviewListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const ReviewItem();
      },
      separatorBuilder: (context, index) => Divider(
        thickness: 1.5,
        color: kSecondaryColor.withOpacity(.5),
        endIndent: 20,
        indent: 20,
      ),
      itemCount: 3,
    );
  }
}
