import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

navigateToAndReplacement({
  required BuildContext context,
  required Widget child,
}) {
  Navigator.of(context).pushReplacement(
    PageTransition(
      child: child,
      type: PageTransitionType.fade,
    ),
  );
}
