import 'dart:async';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/utils/shared_preferences.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_lang_cubit/update_lang_states.dart';

class UpdateLangCubit extends Cubit<UpdateLangStates> {
  UpdateLangCubit() : super(UpdateLangInitialState());

  List<String> languages = ['en', 'ar'];
  // ignore: deprecated_member_use
  Locale locale = Locale(kLang.isNotEmpty ? kLang : window.locale.languageCode);

  updateLang(String languageCode, context) {
    emit(UpdateLangLoadingState());
    Timer(
      const Duration(seconds: 3),
      () {
        MySharedPreferences.setString('lang', languageCode);
        kLang = languageCode;
        locale = Locale(languageCode);
        emit(UpdateLangSuccessState());
      },
    );
  }
}
