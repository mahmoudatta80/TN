import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';

class CategoryModel extends CategoryEntity{
  late final int categoryId;
  late final String categoryTitle;
  late final String imageUrl;

  CategoryModel({
    required this.categoryId,
    required this.categoryTitle,
    required this.imageUrl,
  }) : super(
    id: categoryId,
    title: categoryTitle,
    image: imageUrl,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['id'],
      categoryTitle: json['name'],
      imageUrl: json['image'],
    );
  }
}