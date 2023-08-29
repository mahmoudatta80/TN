import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/show_toast.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/utils/shared_preferences.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/features/auth/data/models/sign_in_model/sign_in_model.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_in_cubit/sign_in_states.dart';
import 'package:shopping_app/features/home/presentation/manager/functions/navigate_to_layout.dart';

class SignInButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInCubit signInCubit = BlocProvider.of<SignInCubit>(context);
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state is SignInLoadingState) {
          signInCubit.isLoading = true;
        } else if (state is SignInSuccessState) {
          if (state.userResponseModel.status == false) {
            showToast(
              text: state.userResponseModel.message,
            );
          } else {
            showToast(
              text: state.userResponseModel.message,
            );
            kToken = state.userResponseModel.data!.userToken;
            MySharedPreferences.setString(
              'token',
              state.userResponseModel.data!.userToken,
            ).then((value) {
              navigateToLayout(context);
            });
          }
          signInCubit.isLoading = false;
        } else if (state is SignInFailureState) {
          showToast(
            text: state.errorMessage,
          );
          signInCubit.isLoading = false;
        } else {
          signInCubit.isLoading = false;
        }
      },
      builder: (context, state) => signInCubit.isLoading
          ? CustomButton(
              onPressed: () {},
            )
          : CustomButton(
              text: getLang(context, 'Log in'),
              onPressed: () {
                SignInModel signInModel = SignInModel({
                  'password': passwordController.text,
                  'email': emailController.text,
                });
                signInCubit.signIn(signInModel);
              },
            ),
    );
  }
}
