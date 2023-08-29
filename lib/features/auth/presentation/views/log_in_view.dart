import 'package:flutter/material.dart';
import 'package:shopping_app/features/auth/presentation/widgets/log_in_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(23.0),
          child: LogInViewBody(),
        ),
      ),
    );
  }
}
