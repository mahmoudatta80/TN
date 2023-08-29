import 'package:flutter/material.dart';
import 'package:shopping_app/features/auth/presentation/widgets/create_new_password_view_body.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(23.0),
          child: CreateNewPasswordViewBody(),
        ),
      ),
    );
  }
}
