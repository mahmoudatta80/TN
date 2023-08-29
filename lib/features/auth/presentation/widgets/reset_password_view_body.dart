import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/navigate_to.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/core/widgets/custom_form_field.dart';
import 'package:shopping_app/features/auth/presentation/views/verification_view.dart';
import 'package:shopping_app/core/widgets/custom_arrow_back.dart';
import 'package:shopping_app/features/auth/presentation/widgets/rich_text.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({Key? key}) : super(key: key);

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
            'Reset Password',
            style: Styles.text26,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Text(
            'Recover your account password',
            style: Styles.text16.copyWith(
              fontWeight: FontWeight.w400,
              color: kPrimaryColor.withOpacity(.75),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          const CustomFormField(
            text: 'Email Address',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          CustomButton(
            text: 'Next',
            onPressed: () {
              navigateToFromRToL(
                context: context,
                child: const VerificationView(),
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.4),
          const CustomTextRich(),
        ],
      ),
    );
  }
}
