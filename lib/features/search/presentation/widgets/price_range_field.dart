import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/search/presentation/widgets/custom_slider.dart';

class PriceRangeField extends StatelessWidget {
  const PriceRangeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kPrimaryColor.withOpacity(.25), width: 1),
        ),
        child: const CustomSlider(),
      ),
    );
  }
}

