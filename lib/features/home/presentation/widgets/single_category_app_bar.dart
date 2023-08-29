import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/widgets/custom_arrow_back.dart';

class SingleCategoryAppBar extends StatelessWidget {
  final String title;
  const SingleCategoryAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: kThirdColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const CustomArrowBack(),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: Styles.text18.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
