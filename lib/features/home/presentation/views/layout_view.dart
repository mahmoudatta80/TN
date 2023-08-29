import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/presentation/views/cart_view.dart';
import 'package:shopping_app/features/home/presentation/views/home_view.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:shopping_app/features/profile/presentation/views/profile_view.dart';
import 'package:shopping_app/features/search/presentation/views/search_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeView(),
    SearchView(),
    CartView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const CustomDrawer(),
      body: SafeArea(
        child: screens[currentIndex],
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
