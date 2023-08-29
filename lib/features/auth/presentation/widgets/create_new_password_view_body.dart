import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/core/widgets/custom_form_field.dart';
import 'package:shopping_app/core/widgets/custom_arrow_back.dart';
import 'package:shopping_app/features/home/presentation/manager/functions/navigate_to_layout.dart';

class CreateNewPasswordViewBody extends StatelessWidget {
  const CreateNewPasswordViewBody({Key? key}) : super(key: key);

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
            'Create new password',
            style: Styles.text26,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Text(
            'Enter your new password',
            style: Styles.text16.copyWith(
              fontWeight: FontWeight.w400,
              color: kPrimaryColor.withOpacity(.75),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          const CustomFormField(
            text: 'New Password',
            suffixIcon: Icon(
              Icons.visibility_off,
              size: 24,
            ),
            textInputType: TextInputType.text,
            obscureText: true,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          const CustomFormField(
            text: 'Confirm Password',
            suffixIcon: Icon(
              Icons.visibility_off,
              size: 24,
            ),
            textInputType: TextInputType.text,
            obscureText: true,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          CustomButton(
            text: 'Reset',
            onPressed: () {
              navigateToLayout(context);
            },
          ),
        ],
      ),
    );
  }
}
