import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';

class PosterModel extends PosterEntity{
  late final int posterId;
  late final String imageUrl;

  PosterModel({
    required this.posterId,
    required this.imageUrl,
  }) : super(
    id: posterId,
    image: imageUrl,
  );

  factory PosterModel.fromJson(Map<String, dynamic> json) {
    return PosterModel(
      posterId: json['id'],
      imageUrl: json['image'],
    );
  }
}