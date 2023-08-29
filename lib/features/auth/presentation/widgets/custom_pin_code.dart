import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shopping_app/constant.dart';

class CustomPinCode extends StatelessWidget {
  const CustomPinCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      // validator: (value) {
      //   return null;
      // },
      keyboardType: TextInputType.number,
      cursorColor: kPrimaryColor.withOpacity(.25),
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(14),
        borderWidth: 1,
        fieldHeight: 72,
        fieldWidth: 72,
        activeColor: kPrimaryColor.withOpacity(.75),
        selectedColor: kPrimaryColor.withOpacity(.75),
        inactiveColor: kPrimaryColor.withOpacity(.25),
      ),
    );
  }
}
