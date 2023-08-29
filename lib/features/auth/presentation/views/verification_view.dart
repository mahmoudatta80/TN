import 'package:flutter/material.dart';
import 'package:shopping_app/features/auth/presentation/widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(23.0),
          child: VerificationViewBody(),
        ),
      ),
    );
  }
}
