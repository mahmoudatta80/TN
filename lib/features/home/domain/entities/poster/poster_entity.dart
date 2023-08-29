import 'package:hive_flutter/hive_flutter.dart';
part 'poster_entity.g.dart';

@HiveType(typeId: 1)
class PosterEntity {
  @HiveField(0)
  late final int id;
  @HiveField(1)
  late final String image;

  PosterEntity({
    required this.id,
    required this.image,
  });
}