import 'package:hive_flutter/hive_flutter.dart';

void saveBoxData<T>(List<T> products, String boxName) {
  var box = Hive.box<T>(boxName);
  box.addAll(products);
}