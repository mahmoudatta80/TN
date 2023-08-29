import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/errors/server_failure.dart';
import 'package:shopping_app/features/cart/data/data_sources/cart_remote_data_source/cart_remote_data_source.dart';
import 'package:shopping_app/features/cart/data/models/update_cart_model/update_cart_model.dart';
import 'package:shopping_app/features/cart/domain/repos/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl(this.cartRemoteDataSource);

  @override
  Future<Either<Failure, UpdateCartModel>> updateCart(int id) async {
    try {
      UpdateCartModel updateCartModel =
          await cartRemoteDataSource.updateCart(id);
      return Right(updateCartModel);
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
