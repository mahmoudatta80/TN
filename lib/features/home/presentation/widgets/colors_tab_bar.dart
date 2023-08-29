import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_tab.dart';

class ColorsTabBar extends StatefulWidget {
  const ColorsTabBar({Key? key}) : super(key: key);

  @override
  State<ColorsTabBar> createState() => _ColorsTabBarState();
}

class _ColorsTabBarState extends State<ColorsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: tabController,
      indicatorColor: kPrimaryColor.withOpacity(.5),
      indicatorWeight: 2.5,
      onTap: (index) {

      },
      indicatorSize: TabBarIndicatorSize.label,
      tabs: const [
        CustomTab(
          text: 'Green',
          color: Color(0xffA1C89B),
        ),
        CustomTab(
          text: 'Sky Blue',
          color: Color(0xff7485C1),
        ),
        CustomTab(
          text: 'Rose Gold',
          color: Color(0xffC9A19C),
        ),
      ],
    );
  }
}
