import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/navigate_to.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/features/auth/presentation/views/create_new_password_view.dart';
import 'package:shopping_app/core/widgets/custom_arrow_back.dart';
import 'package:shopping_app/features/auth/presentation/widgets/custom_pin_code.dart';
import 'package:shopping_app/features/auth/presentation/widgets/custom_text_button.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomArrowBack(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.044),
          const Text(
            'Verification code',
            style: Styles.text26,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Text(
            'We sent you 4 numbers as a verification code .',
            style: Styles.text16.copyWith(
              fontWeight: FontWeight.w400,
              color: kPrimaryColor.withOpacity(.75),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          const CustomPinCode(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          CustomButton(
            text: 'Confirm',
            onPressed: () {
              navigateToFromRToL(
                context: context,
                child: const CreateNewPasswordView(),
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          CustomTextButton(
            onPressed: () {},
            text: 'resend code ?',
          ),
          CustomTextButton(
            onPressed: () {},
            text: 'edit email ?',
          ),
        ],
      ),
    );
  }
}
