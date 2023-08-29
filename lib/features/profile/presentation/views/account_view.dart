import 'package:flutter/material.dart';
import 'package:shopping_app/features/profile/presentation/widgets/account_app_bar.dart';
import 'package:shopping_app/features/profile/presentation/widgets/account_body.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AccountAppBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: AccountBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
