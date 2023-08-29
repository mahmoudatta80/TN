import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:shopping_app/features/home/presentation/manager/functions/navigate_to_category_view.dart';
import 'package:shopping_app/features/home/presentation/widgets/best_seller_grid_view.dart';
import 'package:shopping_app/features/home/presentation/widgets/category_list_view.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_page_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomPageView(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(getLang(context, 'Categories'), style: Styles.text20),
              CustomTextButton(
                onPressed: () {
                  navigateToCategoryView(context);
                },
                text: getLang(context, 'see all >'),
              ),
            ],
          ),
        ),
        const CategoryListView(),
        const SizedBox(height: 20),
        Divider(
          thickness: 1.5,
          color: kSecondaryColor.withOpacity(.5),
          endIndent: 50,
          indent: 50,
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(getLang(context, 'Best Seller'), style: Styles.text20),
              ],
            ),
          ),
        ),
        const BestSellerGridView(),
      ],
    );
  }
}
