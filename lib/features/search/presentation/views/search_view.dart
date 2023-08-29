import 'package:flutter/material.dart';
import 'package:shopping_app/features/search/presentation/widgets/search_view_body.dart';
import 'package:shopping_app/features/search/presentation/widgets/search_view_app_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchViewAppBar(),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SearchViewBody(),
          ),
        ),
      ],
    );
  }
}
