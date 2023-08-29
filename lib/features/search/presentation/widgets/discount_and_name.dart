import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/features/search/domain/entities/search_entity.dart';

class DiscountAndName extends StatelessWidget {
  final SearchEntity searchEntity;

  const DiscountAndName({Key? key, required this.searchEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${searchEntity.price} \$',
          style: Styles.text13.copyWith(
            color: kPrimaryColor,
          ),
        ),
        Text(
          searchEntity.name,
          style: Styles.text13,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
