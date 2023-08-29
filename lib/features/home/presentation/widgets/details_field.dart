import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';

class DetailsField extends StatefulWidget {
  final String title;
  final String details;

  const DetailsField({
    Key? key,
    required this.title,
    required this.details,
  }) : super(key: key);

  @override
  State<DetailsField> createState() => _DetailsFieldState();
}

class _DetailsFieldState extends State<DetailsField> {
  bool isDetailsShown = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title, style: Styles.text18),
            FloatingActionButton(
              backgroundColor: Colors.white,
              elevation: 0,
              onPressed: () {
                setState(() {
                  isDetailsShown = !isDetailsShown;
                });
              },
              child: Icon(
                isDetailsShown ? Icons.arrow_upward : Icons.arrow_downward,
                size: 18,
                color: kPrimaryColor.withOpacity(.75),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        isDetailsShown
            ? Text(
                widget.details,
                style: Styles.text16WithOpacity,
              )
            : Container(),
        Divider(
          thickness: 1.5,
          color: kSecondaryColor.withOpacity(.5),
          endIndent: 20,
          indent: 20,
        ),
      ],
    );
  }
}
