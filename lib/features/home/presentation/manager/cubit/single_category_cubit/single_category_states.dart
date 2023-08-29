import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

abstract class SingleCategoryStates{}

class SingleCategoryInitial extends SingleCategoryStates{}

class FetchSingleCategoryLoading extends SingleCategoryStates{}

class FetchSingleCategorySuccess extends SingleCategoryStates{
  final List<ProductEntity> productEntity;

  FetchSingleCategorySuccess(this.productEntity);
}

class FetchSingleCategoryFailure extends SingleCategoryStates{
  final String errorMessage;

  FetchSingleCategoryFailure(this.errorMessage);
}