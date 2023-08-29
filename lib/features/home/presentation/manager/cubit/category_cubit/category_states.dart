import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';

abstract class CategoryStates{}

class CategoryInitial extends CategoryStates{}

class FetchCategoryLoading extends CategoryStates{}

class FetchCategorySuccess extends CategoryStates{
  final List<CategoryEntity> categories;

  FetchCategorySuccess(this.categories);
}

class FetchCategoryFailure extends CategoryStates{
  final String errorMessage;

  FetchCategoryFailure(this.errorMessage);
}