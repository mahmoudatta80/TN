import 'dart:ui';

import 'package:shopping_app/core/utils/shared_preferences.dart';

const kButtonPrimaryColor = Color(0xff52285B);

const kButtonSecondaryColor = Color(0xff854F6C);

const kPrimaryColor = Color(0xff2A132E);

const kSecondaryColor = Color(0xff52285B);

const kThirdColor = Color(0xffFCF4F4);

const kErrorColor = Color(0xffF73D3D);

const kStarColor = Color(0xffFFC90A);

const kPoppins = 'Poppins';

const kBestSellerBox = 'bestSellerBox';

const kPosterBox = 'posterBox';

const kCategoryBox = 'categoryBox';

const kFavouriteBox = 'favouriteBox';

const kCartBox = 'cartBox';

String kToken = MySharedPreferences.getString('token');

bool kIsFirst = true;

bool kIsFirstOpened = MySharedPreferences.getBool('isFirstOpened');

String kLang = MySharedPreferences.getString('lang');