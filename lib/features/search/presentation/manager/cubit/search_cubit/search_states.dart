import 'package:shopping_app/features/search/domain/entities/search_entity.dart';

abstract class SearchStates{}

class SearchInitialState extends SearchStates{}

class FetchSearchedProductLoading extends SearchStates{}

class FetchSearchedProductSuccess extends SearchStates{
  final List<SearchEntity> searchedProduct;

  FetchSearchedProductSuccess(this.searchedProduct);
}

class FetchSearchedProductFailure extends SearchStates{
  final String errorMessage;

  FetchSearchedProductFailure(this.errorMessage);
}