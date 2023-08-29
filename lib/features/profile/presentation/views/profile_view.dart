import 'package:flutter/material.dart';
import 'package:shopping_app/features/profile/presentation/widgets/profile_app_bar.dart';
import 'package:shopping_app/features/profile/presentation/widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileAppBar(),
        ProfileBody(),
      ],
    );
  }
}
