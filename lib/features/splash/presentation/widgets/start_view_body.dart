import 'package:flutter/material.dart';
import 'package:shopping_app/core/functions/navigate_to_and_remove.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/utils/shared_preferences.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/features/auth/presentation/widgets/sign_up_provider.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          const SizedBox(
            height: 18,
          ),
          const Text(
            'Thich No',
            style: Styles.text29,
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            getLang(context, 'Your favorite  electronics are  in one place ! just by one click !'),
            style: Styles.text16WithOpacity,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
          ),
          CustomButton(
            text: getLang(context, 'Lets Start'),
            onPressed: () {
              navigateToAndRemoveWithFade(
                context: context,
                child: const SignUpProvider(),
              );
              MySharedPreferences.setBool('isFirstOpened', false);
            },
          ),
        ],
      ),
    );
  }
}
