import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';

class ImptyCart extends StatelessWidget {
  const ImptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.34,
        ),
        Icon(
          Icons.shopping_cart_outlined,
          size: 28,
          color: kPrimaryColor.withOpacity(.75),
        ),
        Text(
          getLang(context, 'Cart is empty'),
          style: Styles.text16WithOpacity,
        ),
      ],
    );
  }
}
