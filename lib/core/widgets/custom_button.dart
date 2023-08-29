import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final void Function() onPressed;

  const CustomButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            color ??
                Color.lerp(
                  kButtonSecondaryColor.withOpacity(.6),
                  kButtonPrimaryColor,
                  0.5,
                ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            const Size(
              double.infinity,
              50,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        onPressed: onPressed,
        child: text == null
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                text ?? '',
                style: TextStyle(
                  fontSize: 18,
                  color: color == null ? Colors.white : kSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
