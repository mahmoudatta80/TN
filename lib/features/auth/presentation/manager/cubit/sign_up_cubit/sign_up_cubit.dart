import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/auth/data/models/sign_up_model/sign_up_model.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_up_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signUpUseCase) : super(SignUpInitialState());

  bool isLoading = false;

  Future signUp(SignUpModel signUpModel) async {
    emit(SignUpLoadingState());

    Either<Failure, UserResponseModel> result =
        await signUpUseCase.call(signUpModel);

    if (isClosed) {
      return;
    }
    result.fold(
      (failure) => emit(SignUpFailureState(failure.message)),
      (userResponseModel) => emit(SignUpSuccessState(userResponseModel)),
    );
  }
}
