import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';

class BrandsListViewItem extends StatelessWidget {
  const BrandsListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: kThirdColor,
        elevation: 5,
        shape: const CircleBorder(),
        child: Image.asset(
          'assets/images/hp.png',
        ),
      ),
    );
  }
}
