import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';
import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<ProductEntity>>> fetchBestSeller();
  Future<Either<Failure, List<PosterEntity>>> fetchPosters();
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories();
  Future<Either<Failure, List<ProductEntity>>> fetchSingleCategories(int id);
  Future<Either<Failure, ProductEntity>> fetchProductDetails(int id);
}