import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';

Future registerAndOpenPosterBox() async{
  Hive.registerAdapter(PosterEntityAdapter());
  await Hive.openBox<PosterEntity>(kPosterBox);
}

Future clearPosterBox() async{
  var posterBox = Hive.box<PosterEntity>(kPosterBox);
  return await posterBox.clear();
}