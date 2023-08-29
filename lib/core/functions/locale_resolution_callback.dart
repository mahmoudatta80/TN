import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/utils/shared_preferences.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_lang_cubit/update_lang_cubit.dart';

localeResolutionCallback(currentLang, supportedLang, context) {
  if (kLang.isNotEmpty) {
    for (Locale locale in supportedLang) {
      if (locale.languageCode == kLang) {
        return BlocProvider.of<UpdateLangCubit>(context).locale;
      }
    }
  } else {
    if (currentLang != null) {
      for (Locale locale in supportedLang) {
        if (locale.languageCode == currentLang.languageCode) {
          MySharedPreferences.setString(
              'lang', currentLang.languageCode);
          kLang = currentLang.languageCode;
          return currentLang;
        }
      }
    }
    MySharedPreferences.setString(
        'lang', supportedLang.first.languageCode);
    kLang = supportedLang.first.languageCode;
    return supportedLang.first;
  }
  return null;
}