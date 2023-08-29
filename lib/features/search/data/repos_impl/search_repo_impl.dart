import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/errors/server_failure.dart';
import 'package:shopping_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:shopping_app/features/search/domain/entities/search_entity.dart';
import 'package:shopping_app/features/search/domain/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, List<SearchEntity>>> searchForProduct(
      String text) async {
    try {
      List<SearchEntity> searchedProduct =
          await searchRemoteDataSource.searchForProduct(text);
      return Right(searchedProduct);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(
            error,
          ),
        );
      }
      return Left(
        ServerFailure(error.toString()),
      );
    }
  }
}
