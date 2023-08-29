import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/widgets/single_category_app_bar.dart';
import 'package:shopping_app/features/home/presentation/widgets/single_category_grid_view.dart';

class SingleCategoryView extends StatelessWidget {
  final String title;
  const SingleCategoryView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SingleCategoryAppBar(
              title: title,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: SingleCategoryGridView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
