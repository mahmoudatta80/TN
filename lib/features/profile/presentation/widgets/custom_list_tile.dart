import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/core/styles/text_styles.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onTap;
  const CustomListTile({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: FaIcon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: Styles.text16,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 20,
      ),
    );
  }
}
