import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

abstract class ProductDetailsStates{}

class ProductDetailsInitial extends ProductDetailsStates{}

class FetchProductDetailsLoading extends ProductDetailsStates{}

class FetchProductDetailsSuccess extends ProductDetailsStates{
  final ProductEntity productEntity;

  FetchProductDetailsSuccess(this.productEntity);
}

class FetchProductDetailsFailure extends ProductDetailsStates{
  final String errorMessage;

  FetchProductDetailsFailure(this.errorMessage);
}