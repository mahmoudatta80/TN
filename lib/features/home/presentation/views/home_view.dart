import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/widgets/home_view_app_bar.dart';
import 'package:shopping_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeViewAppBar(),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: HomeViewBody(),
          ),
        ),
      ],
    );
  }
}
