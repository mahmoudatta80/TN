import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';
import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

abstract class HomeLocalDataSource{
  List<ProductEntity> fetchBestSeller();
  List<PosterEntity> fetchPosters();
  List<CategoryEntity> fetchCategories();
}