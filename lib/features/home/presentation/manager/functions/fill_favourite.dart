import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/best_seller_cubit/best_seller_states.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/favourite_cubit/favourite_cubit.dart';

fillFavourite({
  required FetchBestSellerSuccess state,
  required FavouriteCubit favouriteCubit,
}) {
  for (ProductEntity productEntity in state.products) {
    favouriteCubit.isFavourite.addAll({
      productEntity.id: productEntity.isFavourite,
    });
  }
  favouriteCubit.handleIsFavourite(state.products);
}
