import 'package:flutter/material.dart';
import 'package:shopping_app/features/splash/presentation/widgets/start_view_body.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StartViewBody(),
    );
  }
}
