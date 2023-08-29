import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/service_locator.dart';
import 'package:shopping_app/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:shopping_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:shopping_app/features/auth/presentation/views/log_in_view.dart';

class SignInProvider extends StatelessWidget {
  const SignInProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        SignInUseCase(
          getIt.get<AuthRepoImpl>(),
        ),
      ),
      child: const LogInView(),
    );
  }
}
