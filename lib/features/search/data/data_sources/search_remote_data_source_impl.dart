import 'package:shopping_app/core/utils/api_service.dart';
import 'package:shopping_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:shopping_app/features/search/data/model/search_model.dart';
import 'package:shopping_app/features/search/domain/entities/search_entity.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<SearchEntity>> searchForProduct(String text) async {
    Map<String, dynamic> response = await apiService.post(
        endPoint: 'products/search',
        data: {
          'text': text,
        }
    );
    List<SearchEntity> searchedProduct = [];
    for (var product in response['data']['data']) {
      searchedProduct.add(SearchModel.fromJson(product));
    }
    return searchedProduct;
  }
}