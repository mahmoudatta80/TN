import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

navigateToAndRemoveWithFade({
  required BuildContext context,
  required Widget child,
}) {
  Navigator.of(context).pushAndRemoveUntil(
    PageTransition(
      child: child,
      type: PageTransitionType.fade,
    ),
    (route) => false,
  );
}

navigateToAndRemoveFromRightToLeft({
  required BuildContext context,
  required Widget child,
}) {
  Navigator.of(context).pushAndRemoveUntil(
    PageTransition(
      child: child,
      type: PageTransitionType.rightToLeft,
    ),
        (route) => false,
  );
}
