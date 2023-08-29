import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/register_and_open_boxes.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/bloc_observer.dart';
import 'package:shopping_app/core/utils/shared_preferences.dart';
import 'package:shopping_app/features/cart/data/repos_impl/cart_repo_impl.dart';
import 'package:shopping_app/features/cart/domain/use_cases/update_cart_use_case.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/update_cart_cubit/update_cart_cubit.dart';
import 'package:shopping_app/features/profile/data/repos_impl/profile_repo_impl.dart';
import 'package:shopping_app/features/profile/domain/use_cases/update_favourite_use_case.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_favourite_cubit/update_favourite_cubit.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_lang_cubit/update_lang_cubit.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_lang_cubit/update_lang_states.dart';
import 'package:shopping_app/features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  if(kLang.isEmpty) {
    // ignore: deprecated_member_use
    kLang = window.locale.languageCode;
  }
  await registerAndOpenBoxes();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavouriteCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateFavouriteCubit(
            UpdateFavouriteUseCase(
              getIt.get<ProfileRepoImpl>(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => UpdateCartCubit(
            UpdateCartUseCase(
              getIt.get<CartRepoImpl>(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateLangCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateLangCubit, UpdateLangStates>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: kPoppins,
          ),
          home: const SplashView(),
          localizationsDelegates: const [
            AppLocale.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: BlocProvider.of<UpdateLangCubit>(context).locale,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', 'EG'),
          ],
        );
      },
    );
  }
}
