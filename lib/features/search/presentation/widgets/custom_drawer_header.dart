import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/widgets/custom_arrow_back.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: kThirdColor,
      child: Row(
        children: [
          const CustomArrowBack(),
          const SizedBox(width: 15),
          Text(
            'Filters : ',
            style: Styles.text20.copyWith(
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
