import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';
import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

abstract class HomeRemoteDataSource{
  Future<List<ProductEntity>> fetchBestSeller();
  Future<List<PosterEntity>> fetchPosters();
  Future<List<CategoryEntity>> fetchCategories();
  Future<List<ProductEntity>> fetchSingleCategories(int id);
  Future<ProductEntity> fetchProductDetails(int id);
}