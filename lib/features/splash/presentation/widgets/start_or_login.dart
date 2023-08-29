import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/auth/presentation/widgets/sign_in_provider.dart';
import 'package:shopping_app/features/splash/presentation/views/start_view.dart';

class StartOrLogin extends StatelessWidget {
  const StartOrLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(kIsFirstOpened) {
      return const StartView();
    }else {
      return const SignInProvider();
    }
  }
}
