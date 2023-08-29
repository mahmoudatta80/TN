import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndicator extends StatelessWidget {
  final PageController pageController;

  const CustomIndicator({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect: ExpandingDotsEffect(
        dotColor: kPrimaryColor.withOpacity(.25),
        dotHeight: 8,
        dotWidth: 8,
        spacing: 7.5,
        expansionFactor: 1.1,
        activeDotColor: kPrimaryColor.withOpacity(.75),
      ),
      onDotClicked: (index) {},
    );
  }
}
