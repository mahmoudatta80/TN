import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final Color color;
  const CustomTab({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kThirdColor,
        border: Border.all(
            color: kPrimaryColor.withOpacity(.25)
        ),
      ),
      child: Tab(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              color: color,
              size: 14,
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: Styles.text13.copyWith(
                color: kPrimaryColor.withOpacity(.75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
