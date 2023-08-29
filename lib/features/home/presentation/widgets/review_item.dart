import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
                backgroundColor: Colors.transparent,
                radius: 14,
              ),
              const SizedBox(width: 10),
              Text('Jone Due', style: Styles.text16),
              const Spacer(),
              RatingBar.builder(
                itemCount: 5,
                initialRating: 5,
                minRating: 1,
                itemSize: 18,
                itemPadding: const EdgeInsets.symmetric(horizontal: 3),
                allowHalfRating: true,
                itemBuilder: (context, index) => const Icon(
                  Icons.star_purple500_sharp,
                  color: kStarColor,
                ),
                onRatingUpdate: (value) {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
                  style: Styles.text13.copyWith(
                    color: Colors.black.withOpacity(.75),
                  ),
                ),
              ),
              Text(
                '4,8',
                style: Styles.text13,
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.thumb_up_alt_outlined,
                size: 18,
                color: kPrimaryColor.withOpacity(.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
