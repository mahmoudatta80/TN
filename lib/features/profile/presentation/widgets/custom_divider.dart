import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: kSecondaryColor.withOpacity(.5),
      endIndent: 20,
      indent: 20,
    );
  }
}
