import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/core/styles/text_styles.dart';

class CustomError extends StatelessWidget {
  final String errorMessage;

  const CustomError({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/error.json',
            width: MediaQuery.of(context).size.width * 0.5
          ),
          Text(
            errorMessage,
            style: Styles.text16WithOpacity,
          ),
        ],
      ),
    );
  }
}
