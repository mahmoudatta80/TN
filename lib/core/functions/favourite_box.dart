import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

Future registerAndOpenFavouriteBox() async{
  await Hive.openBox<ProductEntity>(kFavouriteBox);
}

Future clearFavouriteBox() async{
  var favouriteBox = Hive.box<ProductEntity>(kFavouriteBox);
  return await favouriteBox.clear();
}