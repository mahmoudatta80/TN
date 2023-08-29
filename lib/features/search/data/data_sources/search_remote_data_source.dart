import 'package:shopping_app/features/search/domain/entities/search_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchEntity>> searchForProduct(String text);
}