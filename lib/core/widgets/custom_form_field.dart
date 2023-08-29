import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';

class CustomFormField extends StatelessWidget {
  final String text;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final TextEditingController? controller;

  const CustomFormField({
    Key? key,
    required this.text,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    required this.textInputType,
    this.onChanged,
    this.controller,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      cursorColor: kPrimaryColor.withOpacity(.5),
      style: Styles.text13,
      controller: controller,
      decoration: InputDecoration(
        helperStyle: TextStyle(color: kPrimaryColor.withOpacity(.5)),
        contentPadding: const EdgeInsets.all(18),
        label: Text(
          text,
          style: Styles.text16,
        ),
        filled: true,
        fillColor: kPrimaryColor.withOpacity(.05),
        hoverColor: kPrimaryColor.withOpacity(.5),
        focusColor: kPrimaryColor.withOpacity(.5),
        suffixIconColor: kPrimaryColor.withOpacity(.5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: kPrimaryColor.withOpacity(.05),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: kPrimaryColor.withOpacity(.05),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: kPrimaryColor.withOpacity(.05),
          ),
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      validator: validator,
    );
  }
}
