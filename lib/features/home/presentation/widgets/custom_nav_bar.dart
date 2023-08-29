import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/constant.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  const CustomNavBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        color: kThirdColor,
      ),
      child: BottomNavigationBar(
        backgroundColor: kThirdColor,
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(
          // size: 26,
          color: kSecondaryColor,
        ),
        unselectedIconTheme: IconThemeData(
          // size: 26,
          color: kPrimaryColor.withOpacity(.5),
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 26,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              // ignore: deprecated_member_use
              FontAwesomeIcons.search,
              size: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.user,
              size: 22,
            ),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
