import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';

Future registerAndOpenCategoryBox() async{
  Hive.registerAdapter(CategoryEntityAdapter());
  await Hive.openBox<CategoryEntity>(kCategoryBox);
}

Future clearCategoryBox() async{
  var categoryBox = Hive.box<CategoryEntity>(kCategoryBox);
  return await categoryBox.clear();
}