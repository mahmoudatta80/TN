import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/service_locator.dart';
import 'package:shopping_app/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:shopping_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_out_cubit/sign_out_cubit.dart';
import 'package:shopping_app/features/profile/presentation/views/log_out_view.dart';

class LogOutProvider extends StatelessWidget {
  const LogOutProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(
        SignOutUseCase(
          getIt.get<AuthRepoImpl>(),
        ),
      ),
      child: const LogOutView(),
    );
  }
}
