import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/core/functions/cart_box.dart';
import 'package:shopping_app/core/functions/category_box.dart';
import 'package:shopping_app/core/functions/favourite_box.dart';
import 'package:shopping_app/core/functions/poster_box.dart';
import 'package:shopping_app/core/functions/product_box.dart';

Future registerAndOpenBoxes() async{
  await Hive.initFlutter();
  await registerAndOpenProductBox();
  await registerAndOpenPosterBox();
  await registerAndOpenCategoryBox();
  await registerAndOpenFavouriteBox();
  await registerAndOpenCartBox();
}