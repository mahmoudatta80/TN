import 'package:flutter/material.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/features/search/presentation/widgets/brands_field.dart';
import 'package:shopping_app/features/search/presentation/widgets/colors_field.dart';
import 'package:shopping_app/features/search/presentation/widgets/price_range_field.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Brands:', style: Styles.text16),
          const BrandsField(),
          const SizedBox(height:20),
          Text('Colors:', style: Styles.text16),
          const ColorsField(),
          const SizedBox(height:20),
          Text('Price range:', style: Styles.text16),
          const PriceRangeField(),
        ],
      ),
    );
  }
}
