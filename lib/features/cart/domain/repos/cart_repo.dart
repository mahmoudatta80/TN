import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/cart/data/models/update_cart_model/update_cart_model.dart';

abstract class CartRepo{
  Future<Either<Failure, UpdateCartModel>> updateCart(int id);
}