import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/widgets/custom_arrow_back.dart';

class FavouriteAppBar extends StatelessWidget {
  const FavouriteAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: kThirdColor,
      child: Row(
        children: [
          const CustomArrowBack(),
          SizedBox(width: MediaQuery.of(context).size.width * 0.26),
          Text(
            getLang(context, 'Favourites'),
            style: Styles.text18.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
