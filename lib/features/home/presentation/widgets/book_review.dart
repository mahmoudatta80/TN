import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/features/home/presentation/widgets/review_list_view.dart';

class BookReview extends StatefulWidget {
  const BookReview({Key? key}) : super(key: key);

  @override
  State<BookReview> createState() => _BookReviewState();
}

class _BookReviewState extends State<BookReview> {
  bool isReviewsShown = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              getLang(context, 'Reviews (25)'),
              style: Styles.text18.copyWith(color: kSecondaryColor),
            ),
            FloatingActionButton(
              backgroundColor: Colors.white,
              elevation: 0,
              onPressed: () {
                setState(() {
                  isReviewsShown = !isReviewsShown;
                });
              },
              child: Icon(
                isReviewsShown? Icons.arrow_upward : Icons.arrow_downward,
                size: 18,
                color: kPrimaryColor.withOpacity(.75),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.star_purple500_sharp,
              size: 18,
              color: kStarColor,
            ),
            const SizedBox(width: 5),
            Text(
              '4,8',
              style: Styles.text13,
            ),
          ],
        ),
        isReviewsShown ? const ReviewListView() : Container(),
      ],
    );
  }
}
