import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/search/domain/entities/search_entity.dart';

abstract class SearchRepo{
  Future<Either<Failure, List<SearchEntity>>> searchForProduct(String text);
}