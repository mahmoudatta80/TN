import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

abstract class BestSellerStates{}

class BestSellerInitial extends BestSellerStates{}

class FetchBestSellerLoading extends BestSellerStates{}

class FetchBestSellerSuccess extends BestSellerStates{
  final List<ProductEntity> products;

  FetchBestSellerSuccess(this.products);
}

class FetchBestSellerFailure extends BestSellerStates{
  final String errorMessage;

  FetchBestSellerFailure(this.errorMessage);
}