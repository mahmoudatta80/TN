import 'package:hive_flutter/hive_flutter.dart';
part 'category_entity.g.dart';

@HiveType(typeId: 2)
class CategoryEntity {
  @HiveField(0)
  late final int id;
  @HiveField(1)
  late final String title;
  @HiveField(2)
  late final String image;

  CategoryEntity({
    required this.id,
    required this.title,
    required this.image,
  });
}
