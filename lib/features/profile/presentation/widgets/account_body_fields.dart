import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/functions/show_toast.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/core/widgets/custom_form_field.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/profile/data/models/update_profile_model/update_profile_model.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_profile_cubit/update_profile_states.dart';

class AccountBodyFields extends StatefulWidget {
  final UserResponseModel userResponseModel;

  const AccountBodyFields({
    Key? key,
    required this.userResponseModel,
  }) : super(key: key);

  @override
  State<AccountBodyFields> createState() => _AccountBodyFieldsState();
}

class _AccountBodyFieldsState extends State<AccountBodyFields> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userResponseModel.data?.userName ?? '';
    emailController.text = widget.userResponseModel.data?.userEmail ?? '';
    phoneController.text = widget.userResponseModel.data?.userPhone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    UpdateProfileCubit updateProfileCubit =
        BlocProvider.of<UpdateProfileCubit>(context);
    return BlocConsumer<UpdateProfileCubit, UpdateProfileStates>(
      listener: (context, state) {
        if (state is UpdateProfileLoadingState) {
          updateProfileCubit.isLoading = true;
        } else if (state is UpdateProfileSuccessState) {
          if (state.userResponseModel.status == false) {
            showToast(
              text: state.userResponseModel.message,
            );
          } else {
            showToast(
              text: state.userResponseModel.message,
            );
            Navigator.of(context).pop();
          }
          updateProfileCubit.isLoading = false;
        } else if (state is UpdateProfileFailureState) {
          showToast(
            text: state.errorMessage,
          );
          updateProfileCubit.isLoading = false;
        } else {
          updateProfileCubit.isLoading = false;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomFormField(
              text: getLang(context, 'Full Name'),
              textInputType: TextInputType.text,
              controller: nameController,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            CustomFormField(
              text: getLang(context, 'Email Address'),
              textInputType: TextInputType.text,
              controller: emailController,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            CustomFormField(
              text: getLang(context, 'Phone Number'),
              textInputType: TextInputType.number,
              controller: phoneController,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            updateProfileCubit.isLoading
                ? CustomButton(
                    onPressed: () {},
                  )
                : CustomButton(
                    text: getLang(context, 'Save changes'),
                    onPressed: () {
                      UpdateProfileModel updateProfileModel =
                          UpdateProfileModel({
                        'name': nameController.text,
                        'email': emailController.text,
                        'phone': phoneController.text,
                      });
                      updateProfileCubit.updateProfile(updateProfileModel);
                    },
                  ),
          ],
        );
      },
    );
  }
}
