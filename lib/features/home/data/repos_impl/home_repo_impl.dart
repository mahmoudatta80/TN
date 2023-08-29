import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/errors/server_failure.dart';
import 'package:shopping_app/features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:shopping_app/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';
import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(this.homeRemoteDataSource, this.homeLocalDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchBestSeller() async {
    try {
      List<ProductEntity> products;
      products = homeLocalDataSource.fetchBestSeller();
      if (products.isNotEmpty) {
        kIsFirst = false;
        return Right(products);
      }
      kIsFirst = true;
      products = await homeRemoteDataSource.fetchBestSeller();
      return Right(products);
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

  @override
  Future<Either<Failure, List<PosterEntity>>> fetchPosters() async {
    try {
      List<PosterEntity> posters;
      posters = homeLocalDataSource.fetchPosters();
      if (posters.isNotEmpty) {
        return Right(posters);
      }
      posters = await homeRemoteDataSource.fetchPosters();
      return Right(posters);
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

  @override
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories() async {
    try {
      List<CategoryEntity> categories;
      categories = homeLocalDataSource.fetchCategories();
      if (categories.isNotEmpty) {
        return Right(categories);
      }
      categories = await homeRemoteDataSource.fetchCategories();
      return Right(categories);
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

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchSingleCategories(
      int id) async {
    try {
      List<ProductEntity> singleCategory =
          await homeRemoteDataSource.fetchSingleCategories(id);
      return Right(singleCategory);
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

  @override
  Future<Either<Failure, ProductEntity>> fetchProductDetails(int id) async {
    try {
      ProductEntity productEntity =
          await homeRemoteDataSource.fetchProductDetails(id);
      return Right(productEntity);
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
