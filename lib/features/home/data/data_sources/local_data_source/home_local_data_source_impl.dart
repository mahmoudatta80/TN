import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';
import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<ProductEntity> fetchBestSeller() {
    var productBox = Hive.box<ProductEntity>(kBestSellerBox);
    return productBox.values.toList();
  }

  @override
  List<PosterEntity> fetchPosters() {
    var posterBox = Hive.box<PosterEntity>(kPosterBox);
    return posterBox.values.toList();
  }

  @override
  List<CategoryEntity> fetchCategories() {
    var categoryBox = Hive.box<CategoryEntity>(kCategoryBox);
    return categoryBox.values.toList();
  }
}