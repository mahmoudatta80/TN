import 'package:flutter/material.dart';

import '../../../../constant.dart';

class CustomSocialIcons extends StatelessWidget {
  const CustomSocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/images/chrome.png',
          height: 34,
        ),
        Container(
          width: 1,
          height: 48,
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(.5),
          ),
        ),
        Image.asset(
          'assets/images/facebook.png',
          height: 30,
        ),
      ],
    );
  }
}
