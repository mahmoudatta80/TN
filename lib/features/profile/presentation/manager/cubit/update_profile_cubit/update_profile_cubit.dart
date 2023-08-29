import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/profile/data/models/update_profile_model/update_profile_model.dart';
import 'package:shopping_app/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_profile_cubit/update_profile_states.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  final UpdateProfileUseCase updateProfileUseCase;

  UpdateProfileCubit(this.updateProfileUseCase)
      : super(UpdateProfileInitialState());

  bool isLoading = false;

  Future updateProfile(UpdateProfileModel updateProfileModel) async {
    emit(UpdateProfileLoadingState());

    Either<Failure, UserResponseModel> result =
        await updateProfileUseCase.call(updateProfileModel);

    if (isClosed) {
      return;
    }
    result.fold(
      (failure) => emit(UpdateProfileFailureState(failure.message)),
      (userResponseModel) => emit(UpdateProfileSuccessState(userResponseModel)),
    );
  }
}
