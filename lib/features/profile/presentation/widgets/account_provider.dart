import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/service_locator.dart';
import 'package:shopping_app/features/profile/data/repos_impl/profile_repo_impl.dart';
import 'package:shopping_app/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:shopping_app/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/get_profile_cubit/get_profile_cubit.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:shopping_app/features/profile/presentation/views/account_view.dart';

class AccountProvider extends StatelessWidget {
  const AccountProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProfileCubit(
            GetProfileUseCase(
              getIt.get<ProfileRepoImpl>(),
            ),
          )..getProfile(),
        ),
        BlocProvider(
          create: (context) => UpdateProfileCubit(
            UpdateProfileUseCase(
              getIt.get<ProfileRepoImpl>(),
            ),
          ),
        ),
      ],
      child: const AccountView(),
    );
  }
}
