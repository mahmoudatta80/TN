import 'package:shopping_app/core/functions/cart_box.dart';
import 'package:shopping_app/core/functions/category_box.dart';
import 'package:shopping_app/core/functions/favourite_box.dart';
import 'package:shopping_app/core/functions/poster_box.dart';
import 'package:shopping_app/core/functions/product_box.dart';

Future clearBoxes() async{
  await clearProductBox();
  await clearCategoryBox();
  await clearPosterBox();
  await clearFavouriteBox();
  await clearCartBox();
}