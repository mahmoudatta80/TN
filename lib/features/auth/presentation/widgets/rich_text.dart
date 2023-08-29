import 'package:flutter/material.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';

import '../../../../constant.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: getLang(context, 'By continuing, you agree to what we have '),
            style: Styles.text13.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: getLang(context, ' Terms,Community Guidelines & Privacy policy'),
            style: Styles.text13.copyWith(
              color: kSecondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
