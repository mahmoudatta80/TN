import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/best_seller_cubit/best_seller_states.dart';

fillCart({
  required FetchBestSellerSuccess state,
  required CartCubit cartCubit,
}) {
  for (ProductEntity productEntity in state.products) {
    cartCubit.isCart.addAll({
      productEntity.id: productEntity.isCart,
    });
  }
  cartCubit.handleIsCart(state.products);
}
