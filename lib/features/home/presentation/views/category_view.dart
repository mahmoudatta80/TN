import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/widgets/category_view_app_bar.dart';
import 'package:shopping_app/features/home/presentation/widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CategoryViewAppBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: CategoryViewBody(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
