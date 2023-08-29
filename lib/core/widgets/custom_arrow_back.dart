import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          kLang == 'en'
              ? Icons.arrow_circle_left_outlined
              : Icons.arrow_circle_right_outlined,
          size: 30,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
