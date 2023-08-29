import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_app/features/home/presentation/widgets/layout_provider.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/splash/presentation/widgets/start_or_login.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/logo.png'),
      splashIconSize: 250,
      duration: 2500,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: kToken.isEmpty ? const StartOrLogin() : const LayoutProvider(),
    );
  }
}
