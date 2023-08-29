import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';

class ImptyFavourite extends StatelessWidget {
  const ImptyFavourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        Icon(
          Icons.favorite_outline,
          size: 28,
          color: kPrimaryColor.withOpacity(.75),
        ),
        Text(
          'Favourite is empty',
          style: Styles.text16WithOpacity,
        ),
      ],
    );
  }
}
