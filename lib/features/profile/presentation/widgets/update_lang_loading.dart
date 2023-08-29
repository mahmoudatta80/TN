import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';

class UpdateLangLoading extends StatelessWidget {
  final String message;

  const UpdateLangLoading({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        Text(message, style: Styles.text16WithOpacity),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          backgroundColor: kPrimaryColor.withOpacity(.4),
          color: kPrimaryColor,
        ),
      ],
    );
  }
}
