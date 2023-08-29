import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/constant.dart';

showToast({
  required String text,
}) async{
  await Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 4,
    backgroundColor: kButtonPrimaryColor.withOpacity(.9),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
