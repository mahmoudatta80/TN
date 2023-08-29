import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/widgets/custom_error.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/get_profile_cubit/get_profile_cubit.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/get_profile_cubit/get_profile_states.dart';
import 'package:shopping_app/features/profile/presentation/widgets/account_body_fields.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: MediaQuery.of(context).size.height * 0.06,
        start: 16,
        end: 16,
      ),
      child: BlocBuilder<GetProfileCubit, GetProfileStates>(
        builder: (context, state) {
          if (state is GetProfileSuccessState) {
            return AccountBodyFields(
              userResponseModel: state.userResponseModel,
            );
          } else if (state is GetProfileFailureState) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                CustomError(
                  errorMessage: state.errorMessage,
                ),
              ],
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                const CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
