import 'package:flutter/material.dart';
import 'package:shopping_app/features/auth/presentation/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(23.0),
          child: ResetPasswordViewBody(),
        ),
      ),
    );
  }
}