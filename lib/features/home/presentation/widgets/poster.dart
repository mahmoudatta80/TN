import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/widgets/custom_cached_network_image.dart';
import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';

class Poster extends StatelessWidget {
  final PosterEntity posterEntity;

  const Poster({Key? key, required this.posterEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              kButtonSecondaryColor.withOpacity(.6),
              kSecondaryColor,
            ],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getLang(context, 'Special Prices !'),
                    style: Styles.text29.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    getLang(context, 'stars from 1.550'),
                    style: Styles.text16WithOpacity.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCachedNetworkImage(
                image: posterEntity.image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
