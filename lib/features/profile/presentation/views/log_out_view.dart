import 'package:flutter/material.dart';
import 'package:shopping_app/features/profile/presentation/widgets/log_out_app_bar.dart';
import 'package:shopping_app/features/profile/presentation/widgets/log_out_body.dart';

class LogOutView extends StatelessWidget {
  const LogOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LogOutAppBar(),
            Expanded(
              child: LogOutBody(),
            ),
          ],
        ),
      ),
    );
  }
}
