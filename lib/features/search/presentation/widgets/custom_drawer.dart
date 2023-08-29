import 'package:flutter/material.dart';
import 'package:shopping_app/features/search/presentation/widgets/custom_drawer_header.dart';
import 'package:shopping_app/features/search/presentation/widgets/drawer_body.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Drawer(
        child: Column(
          children: [
            CustomDrawerHeader(),
            DrawerBody(),
          ],
        ),
      ),
    );
  }
}
