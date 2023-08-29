import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/auth/data/models/sign_in_model/sign_in_model.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_in_cubit/sign_in_states.dart';

class SignInCubit extends Cubit<SignInStates> {
  final SignInUseCase signInUseCase;

  SignInCubit(this.signInUseCase) : super(SignInInitialState());

  bool isLoading = false;

  Future signIn(SignInModel signInModel) async {
    emit(SignInLoadingState());

    Either<Failure, UserResponseModel> result =
    await signInUseCase.call(signInModel);

    if (isClosed) {
      return;
    }
    result.fold(
          (failure) => emit(SignInFailureState(failure.message)),
          (userResponseModel) => emit(SignInSuccessState(userResponseModel)),
    );
  }
}