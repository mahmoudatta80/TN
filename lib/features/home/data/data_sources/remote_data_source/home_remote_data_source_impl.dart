import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/utils/api_service.dart';
import 'package:shopping_app/core/utils/end_points.dart';
import 'package:shopping_app/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:shopping_app/features/home/data/models/category_model.dart';
import 'package:shopping_app/features/home/data/models/poster_model.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';
import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';
import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/presentation/manager/functions/save_box.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductEntity>> fetchBestSeller() async{
    Map<String, dynamic> response = await apiService.get(endPoint: EndPoints.home);
    List<ProductEntity> products = [];
    for(var product in response['data']['products']) {
      products.add(ProductModel.fromJson(product));
    }
    saveBoxData<ProductEntity>(products, kBestSellerBox);
    return products;
  }

  @override
  Future<List<PosterEntity>> fetchPosters() async{
    Map<String, dynamic> response = await apiService.get(endPoint: EndPoints.home);
    List<PosterEntity> posters = [];
    for(var poster in response['data']['banners']) {
      posters.add(PosterModel.fromJson(poster));
    }
    saveBoxData<PosterEntity>(posters, kPosterBox);
    return posters;
  }

  @override
  Future<List<CategoryEntity>> fetchCategories() async{
    Map<String, dynamic> response = await apiService.get(endPoint: EndPoints.categories);
    List<CategoryEntity> categories = [];
    for(var category in response['data']['data']) {
      categories.add(CategoryModel.fromJson(category));
    }
    saveBoxData<CategoryEntity>(categories, kCategoryBox);
    return categories;
  }

  @override
  Future<List<ProductEntity>> fetchSingleCategories(int id) async{
    Map<String, dynamic> response = await apiService.get(endPoint: '${EndPoints.categories}/$id');
    List<ProductEntity> singleCategories = [];
    for(var singleCategory in response['data']['data']) {
      singleCategories.add(ProductModel.fromJson(singleCategory));
    }
    return singleCategories;
  }

  @override
  Future<ProductEntity> fetchProductDetails(int id) async{
    Map<String, dynamic> response = await apiService.get(endPoint: '${EndPoints.products}/$id');
    ProductEntity productEntity = ProductModel.fromJson(response['data']);
    return productEntity;
  }
}