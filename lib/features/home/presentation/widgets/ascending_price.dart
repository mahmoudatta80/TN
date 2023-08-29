import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';

class AscendingPrice extends StatelessWidget {
  const AscendingPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kThirdColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: kPrimaryColor.withOpacity(.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ascending price',
                style: Styles.text13,
              ),
              Icon(
                Icons.arrow_upward,
                size: 14,
                color: kPrimaryColor.withOpacity(.5),
              ),
              Icon(
                Icons.arrow_downward,
                size: 14,
                color: kPrimaryColor.withOpacity(.5),
              ),
            ],
          ),
        ),
        const Spacer(),
        ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          child: Row(
            children: [
              Text(
                'Filters',
                style: Styles.text13,
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.category_outlined,
                size: 16,
                color: kPrimaryColor.withOpacity(.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
