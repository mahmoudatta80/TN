import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/clear_boxes.dart';
import 'package:shopping_app/core/functions/navigate_to_and_remove.dart';
import 'package:shopping_app/core/functions/show_toast.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/utils/shared_preferences.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_out_cubit/sign_out_cubit.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_out_cubit/sign_out_states.dart';
import 'package:shopping_app/features/auth/presentation/widgets/sign_in_provider.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignOutCubit signOutCubit = BlocProvider.of<SignOutCubit>(context);
    return BlocConsumer<SignOutCubit, SignOutStates>(
      listener: (context, state) {
        if (state is SignOutLoadingState) {
          signOutCubit.isLoading = true;
        } else if (state is SignOutSuccessState) {
          if (state.signOutModel.status == false) {
            showToast(
              text: state.signOutModel.message,
            );
          } else {
            showToast(
              text: state.signOutModel.message,
            );
            MySharedPreferences.setString('token', '').then((value) async{
              navigateToAndRemoveWithFade(
                context: context,
                child: const SignInProvider(),
              );
              BlocProvider.of<CartCubit>(context).totalCartPrice = 0;
              await clearBoxes();
            });
          }
          signOutCubit.isLoading = false;
        } else if (state is SignOutFailureState) {
          showToast(
            text: state.errorMessage,
          );
          signOutCubit.isLoading = false;
        } else {
          signOutCubit.isLoading = false;
        }
      },
      builder: (context, state) => signOutCubit.isLoading
          ? CustomButton(
              onPressed: () {},
            )
          : CustomButton(
              text: getLang(context, 'Log out'),
              onPressed: () {
                signOutCubit.signOut(kToken);
              },
            ),
    );
  }
}
