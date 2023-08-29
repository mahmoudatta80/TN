import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/auth/data/models/sign_out_model/sign_out_model.dart';
import 'package:shopping_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:shopping_app/features/auth/presentation/manager/cubit/sign_out_cubit/sign_out_states.dart';

class SignOutCubit extends Cubit<SignOutStates> {
  final SignOutUseCase signOutUseCase;

  SignOutCubit(this.signOutUseCase) : super(SignOutInitialState());

  bool isLoading = false;

  Future signOut(String token) async {
    emit(SignOutLoadingState());

    Either<Failure, SignOutModel> result = await signOutUseCase.call(token);

    if (isClosed) {
      return;
    }
    result.fold(
      (failure) => emit(SignOutFailureState(failure.message)),
      (signOutModel) => emit(SignOutSuccessState(signOutModel)),
    );
  }
}
