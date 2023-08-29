import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';

class BrandsField extends StatelessWidget {
  const BrandsField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 10,
        bottom: 10,
        end: 60
      ),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          mainAxisExtent: 50
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              color: kThirdColor,
              elevation: 5,
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/hp.png',
                ),
              ),
            ),
          );
        },
        itemCount: 6,
      ),
    );
  }
}
