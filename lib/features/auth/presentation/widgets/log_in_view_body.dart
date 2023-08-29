import 'package:flutter/material.dart';
import 'package:shopping_app/core/functions/navigate_to_and_replacement.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/widgets/custom_form_field.dart';
import 'package:shopping_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:shopping_app/features/auth/presentation/widgets/rich_text.dart';
import 'package:shopping_app/features/auth/presentation/widgets/sign_in_button.dart';
import 'package:shopping_app/features/auth/presentation/widgets/sign_up_provider.dart';

class LogInViewBody extends StatefulWidget {
  const LogInViewBody({Key? key}) : super(key: key);

  @override
  State<LogInViewBody> createState() => _LogInViewBodyState();
}

class _LogInViewBodyState extends State<LogInViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            getLang(context, 'Welcome Back !'),
            style: Styles.text26,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.044),
          CustomFormField(
            text: getLang(context, 'Email Address'),
            controller: emailController,
            textInputType: TextInputType.text,
            onSubmit: (text) {
              
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
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
          CustomTextButton(
            onPressed: () {
              // navigateToFromRToL(
              //   context: context,
              //   child: const ResetPasswordView(),
              // );
            },
            text: getLang(context, 'reset password'),
          ),
          SignInButton(
            emailController: emailController,
            passwordController: passwordController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getLang(context, 'have not an account ?'),
                style: Styles.text18WithOpacity,
              ),
              TextButton(
                onPressed: () {
                  navigateToAndReplacement(
                    context: context,
                    child: const SignUpProvider(),
                  );
                },
                child: Text(
                  getLang(context, 'Sign up'),
                  style: Styles.text20,
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.340),
          const CustomTextRich(),
        ],
      ),
    );
  }
}
