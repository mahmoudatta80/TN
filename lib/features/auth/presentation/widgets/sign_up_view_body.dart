import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/navigate_to_and_replacement.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/widgets/custom_form_field.dart';
import 'package:shopping_app/features/auth/presentation/widgets/custom_social_icons.dart';
import 'package:shopping_app/features/auth/presentation/widgets/rich_text.dart';
import 'package:shopping_app/features/auth/presentation/widgets/sign_in_provider.dart';
import 'package:shopping_app/features/auth/presentation/widgets/sign_up_button.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Text(
            getLang(context, 'Join us now !'),
            style: Styles.text26,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomFormField(
            text: getLang(context, 'Full Name'),
            controller: nameController,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          CustomFormField(
            text: getLang(context, 'Email Address'),
            controller: emailController,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          CustomFormField(
            text: getLang(context, 'Phone Number'),
            controller: phoneController,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          CustomFormField(
            text: getLang(context, 'Password'),
            controller: passwordController,
            suffixIcon: isVisible ? IconButton(
              onPressed: () {
                isVisible = false;
                setState(() {});
              },
              icon: const Icon(
                Icons.visibility,
                size: 24,
              ),
            ) : IconButton(
              onPressed: () {
                isVisible = true;
                setState(() {});
              },
              icon: const Icon(
                Icons.visibility_off,
                size: 24,
              ),
            ),
            textInputType: TextInputType.text,
            obscureText: isVisible ? false : true,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          Text(
            getLang(context, 'or'),
            style: Styles.text16WithOpacity.copyWith(
              color: kPrimaryColor.withOpacity(.75),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Text(
            getLang(context, 'sign up with'),
            style: Styles.text18WithOpacity,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          const CustomSocialIcons(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          SignUpButton(
            emailController: emailController,
            nameController: nameController,
            passwordController: passwordController,
            phoneController: phoneController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getLang(context, 'have an account ?'),
                style: Styles.text18WithOpacity,
              ),
              TextButton(
                onPressed: () {
                  navigateToAndReplacement(
                    context: context,
                    child: const SignInProvider(),
                  );
                },
                child: Text(
                  getLang(context, 'Log in'),
                  style: Styles.text20,
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          const CustomTextRich(),
        ],
      ),
    );
  }
}
