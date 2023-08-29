import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/favourite_cubit/favourite_states.dart';

class FavouriteCubit extends Cubit<FavouriteStates> {
  FavouriteCubit() : super(FavouriteInitialState());

  Map<int, bool> isFavourite = {};
  Map<int, int> keys = {};
  var favourites = Hive.box<ProductEntity>(kFavouriteBox);
  int index = 0;

  handleIsFavourite(List<ProductEntity> products) async{
    if(kIsFirst) {
      for (ProductEntity productEntity in products) {
        if(productEntity.isFavourite) {
          await addToFavourite(productEntity);
        }
      }
    }else {
      for (ProductEntity productEntity in favourites.values.toList()) {
        isFavourite[productEntity.id] = true;
        keys.addAll({
          productEntity.id: favourites.keys.toList()[index++],
        });
      }
    }
  }

  addToFavourite(ProductEntity productEntity) async {
    isFavourite[productEntity.id] = true;
    var key = await favourites.add(productEntity);
    keys.addAll({
      productEntity.id: key,
    });
    emit(AddToFavouriteState());
  }

  deleteFromFavourite(ProductEntity productEntity) async {
    isFavourite[productEntity.id] = false;
    await favourites.delete(keys[productEntity.id]);
    keys.remove(productEntity.id);
    emit(DeleteFromFavouriteState());
  }
}
