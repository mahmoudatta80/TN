import 'package:flutter/material.dart';
import 'package:shopping_app/features/profile/presentation/widgets/favourite_app_bar.dart';
import 'package:shopping_app/features/profile/presentation/widgets/favourite_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FavouriteAppBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: FavouriteBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
