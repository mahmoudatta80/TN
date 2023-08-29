import 'package:flutter/material.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/features/profile/presentation/widgets/log_out_button.dart';

class LogOutBody extends StatelessWidget {
  const LogOutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            getLang(context, 'Are you sure you want to log out ?'),
            style: Styles.text20.copyWith(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            getLang(context,
                'If you logged out you would need to re-enter the Email and password if you want to enter again.'),
            style: Styles.text13,
            textAlign: TextAlign.center,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: getLang(context, 'Cancel'),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(width: 20),
              const Expanded(
                child: LogOutButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
