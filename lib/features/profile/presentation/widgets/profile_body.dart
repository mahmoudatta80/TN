import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/navigate_to.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/features/profile/presentation/views/favourite_view.dart';
import 'package:shopping_app/features/profile/presentation/views/language_view.dart';
import 'package:shopping_app/features/profile/presentation/widgets/account_provider.dart';
import 'package:shopping_app/features/profile/presentation/widgets/custom_divider.dart';
import 'package:shopping_app/features/profile/presentation/widgets/custom_list_tile.dart';
import 'package:shopping_app/features/profile/presentation/widgets/log_out_provider.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Card(
        elevation: 2,
        color: kThirdColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 18,
          ),
          child: Column(
            children: [
              CustomListTile(
                onTap: () {
                  navigateToFromRToL(
                    context: context,
                    child: const AccountProvider(),
                  );
                },
                title: getLang(context, 'Your account'),
                icon: FontAwesomeIcons.user,
              ),
              const CustomDivider(),
              CustomListTile(
                onTap: () {
                  navigateToFromRToL(
                    context: context,
                    child: const FavouriteView(),
                  );
                },
                title: getLang(context, 'Favourites'),
                icon: FontAwesomeIcons.bookmark,
              ),
              const CustomDivider(),
              CustomListTile(
                onTap: () {
                  navigateToFromRToL(
                    context: context,
                    child: const LanguageView(),
                  );
                },
                title: getLang(context, 'Languages'),
                icon: Icons.language,
              ),
              const CustomDivider(),
              CustomListTile(
                onTap: () {
                  navigateToFromRToL(
                    context: context,
                    child: const LogOutProvider(),
                  );
                },
                title: getLang(context, 'Log out'),
                // ignore: deprecated_member_use
                icon: FontAwesomeIcons.signOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
