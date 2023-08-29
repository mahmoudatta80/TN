import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';

Future registerAndOpenCartBox() async {
  await Hive.openBox<ProductEntity>(kCartBox);
}

Future clearCartBox() async {
  var cartBox = Hive.box<ProductEntity>(kCartBox);
  return await cartBox.clear();
}
