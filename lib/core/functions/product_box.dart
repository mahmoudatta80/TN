import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

Future registerAndOpenProductBox() async{
  Hive.registerAdapter(ProductEntityAdapter());
  await Hive.openBox<ProductEntity>(kBestSellerBox);
}

Future clearProductBox() async{
  var productBox = Hive.box<ProductEntity>(kBestSellerBox);
  return await productBox.clear();
}