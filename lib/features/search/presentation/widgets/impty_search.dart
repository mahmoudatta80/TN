import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';

class ImptySearch extends StatelessWidget {
  const ImptySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        Icon(
          Icons.search_outlined,
          size: 28,
          color: kPrimaryColor.withOpacity(.75),
        ),
        Text(
          getLang(context, 'Search for any product'),
          style: Styles.text16WithOpacity,
        ),
      ],
    );
  }
}
