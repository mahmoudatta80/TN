import 'package:shopping_app/features/cart/data/models/update_cart_model/update_cart_model.dart';

abstract class CartRemoteDataSource {
  Future<UpdateCartModel> updateCart(int id);
}