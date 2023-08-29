import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_states.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  num totalCartPrice = 0;
  num totalPrice = 10;
  num cartCount = 1;
  Map<int, bool> isCart = {};
  Map<int, int> keys = {};
  Map<int, int> countOrProduct = {};
  var carts = Hive.box<ProductEntity>(kCartBox);
  int index = 0;

  addToCartCount() {
    cartCount++;
    emit(AddToCartCountState());
  }

  minusFromCartCount() {
    cartCount--;
    emit(MinusFromCartCountState());
  }

  addToCountOfProduct(ProductEntity productEntity) {
    countOrProduct[productEntity.id] =
        countOrProduct[productEntity.id]!.toInt() + 1;
    emit(AddToCountOfProductState());
  }

  minusFromCountOfProduct(ProductEntity productEntity) {
    countOrProduct[productEntity.id] =
        countOrProduct[productEntity.id]!.toInt() - 1;
    emit(MinusFromCountOfProductState());
  }

  addToPrice(num price) {
    totalCartPrice += price;
    emit(AddToPriceState());
  }

  minusFromPrice(num price) {
    totalCartPrice -= price;
    emit(MinusFromPriceState());
  }

  handleIsCart(List<ProductEntity> products) async {
    if (kIsFirst) {
      for (ProductEntity productEntity in products) {
        if (productEntity.isCart) {
          await addToCart(productEntity, 1);
        }
      }
    } else {
      for (ProductEntity productEntity in carts.values.toList()) {
        isCart[productEntity.id] = true;
        totalCartPrice += productEntity.price;
        countOrProduct[productEntity.id] = 1;
        keys.addAll({
          productEntity.id: carts.keys.toList()[index++],
        });
      }
    }
  }

  addToCart(ProductEntity productEntity, int count) async {
    isCart[productEntity.id] = true;
    var key = await carts.add(productEntity);
    keys.addAll({productEntity.id: key});
    totalCartPrice += productEntity.newPrice != null
        ? productEntity.newPrice! * count
        : productEntity.price * count;
    countOrProduct.addAll({productEntity.id: count});
    emit(AddToCartState());
  }

  deleteFromCart(ProductEntity productEntity) async {
    isCart[productEntity.id] = false;
    await carts.delete(keys[productEntity.id]);
    keys.remove(productEntity.id);
    totalCartPrice -= productEntity.newPrice != null
        ? productEntity.newPrice! * countOrProduct[productEntity.id]!
        : productEntity.price * countOrProduct[productEntity.id]!;
    countOrProduct.remove(productEntity.id);
    emit(DeleteFromCartState());
  }
}
