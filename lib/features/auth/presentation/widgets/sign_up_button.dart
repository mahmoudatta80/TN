import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/show_toast.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/utils/shared_preferences.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/features/auth/data/models/sign_up_model/sign_up_model.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_up_cubit/sign_up_states.dart';
import 'package:shopping_app/features/home/presentation/manager/functions/navigate_to_layout.dart';

class SignUpButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  const SignUpButton({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpCubit signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          signUpCubit.isLoading = true;
        } else if (state is SignUpSuccessState) {
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
          signUpCubit.isLoading = false;
        } else if (state is SignUpFailureState) {
          showToast(
            text: state.errorMessage,
          );
          signUpCubit.isLoading = false;
        } else {
          signUpCubit.isLoading = false;
        }
      },
      builder: (context, state) => signUpCubit.isLoading
          ? CustomButton(
              onPressed: () {},
            )
          : CustomButton(
              text: getLang(context, 'Sign up'),
              onPressed: () {
                SignUpModel signUpModel = SignUpModel({
                  'name': nameController.text,
                  'password': passwordController.text,
                  'email': emailController.text,
                  'phone': phoneController.text,
                });
                signUpCubit.signUp(signUpModel);
              },
            ),
    );
  }
}
