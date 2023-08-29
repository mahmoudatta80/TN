import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/service_locator.dart';
import 'package:shopping_app/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:shopping_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:shopping_app/features/auth/presentation/views/sign_up_view.dart';

class SignUpProvider extends StatelessWidget {
  const SignUpProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        SignUpUseCase(
            getIt.get<AuthRepoImpl>(),
        ),
      ),
      child: const SignUpView(),
    );
  }
}
