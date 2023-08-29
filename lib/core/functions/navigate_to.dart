import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

navigateToFromRToL({
  required BuildContext context,
  required Widget child,
}) {
  Navigator.of(context).push(
    PageTransition(
      child: child,
      type: PageTransitionType.rightToLeft,
    ),
  );
}

navigateToFromBToT({
  required BuildContext context,
  required Widget child,
}) {
  Navigator.of(context).push(
    PageTransition(
      child: child,
      type: PageTransitionType.bottomToTop,
    ),
  );
}
