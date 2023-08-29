import 'package:flutter/material.dart';
import 'package:shopping_app/features/profile/presentation/widgets/language_view_app_bar.dart';
import 'package:shopping_app/features/profile/presentation/widgets/language_view_body.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LanguageViewAppBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: LanguageViewBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
