import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomTextButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(
            kPrimaryColor.withOpacity(.25),
          ),
          overlayColor: MaterialStateProperty.all(
            kPrimaryColor.withOpacity(.1),
          ),
        ),
        child: Text(
          text,
          style: Styles.text16WithOpacity.copyWith(
            fontWeight: FontWeight.w400,
            color: kPrimaryColor.withOpacity(.75),
          ),
        ),
      ),
    );
  }
}
