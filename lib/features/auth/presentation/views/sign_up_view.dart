import 'package:flutter/material.dart';
import 'package:shopping_app/features/auth/presentation/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(23.0),
          child: SignUpViewBody(),
        ),
      ),
    );
  }
}
