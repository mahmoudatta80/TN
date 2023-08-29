import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double value = 2000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 1.0,
              activeTrackColor: kPrimaryColor.withOpacity(.5),
              thumbColor: kPrimaryColor,
              inactiveTrackColor: kPrimaryColor.withOpacity(.1),
              showValueIndicator: ShowValueIndicator.always,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
              overlayColor: kPrimaryColor.withOpacity(.1),
            ),
            child: Slider(
              value: value,
              min: 5,
              max: 3000,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
              },
              mouseCursor: SystemMouseCursors.text,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '5 \$',
                style: Styles.text13.copyWith(
                  color: kPrimaryColor.withOpacity(.5),
                ),
              ),
              Expanded(
                child: Text(
                  '${value.round()} \$',
                  style: Styles.text16,
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                '3000 \$',
                style: Styles.text13.copyWith(
                  color: kPrimaryColor.withOpacity(.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
